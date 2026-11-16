#!/usr/bin/env python3
# data_comments.py [--write]: gives every data or BSS label line that has no comment (check_comments.py [data]) one,
# from its docs/name_map.csv description when that is clean (no IDA names, raw addresses, lineage or history),
# else from its name and contents (constants, strings, jump tables); adds the routines that use it. Dry run without --write.
import csv,re,glob,subprocess,sys,collections,os
os.chdir(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..'))
rows=list(csv.DictReader(open('docs/name_map.csv')))
ev={r['name']:r for r in rows}
addr2name={r['address'].lstrip('0'):r['name'] for r in rows}
LIN=re.compile(r'\b(9[2-7][GS]|NHLPA ?93|NHL ?9[2-7]|9[2-7] ?(PC|Genesis|SNES)|Genesis|SNES|Sega|NHL9\dPC)\b',re.I)
IDA=re.compile(r'\b(?:sub|loc|unk|dword|byte|word|off|qword|asc|jpt|flt|dbl|stru)_([0-9A-F]{4,})\b')
RAW=re.compile(r'\b[0-9A-F]{5,}h?\b')
HIST=re.compile(r'\b(was|renamed|formerly|matches|match|similarity|sem \d)\b',re.I)
# references: label -> routines
refs=collections.defaultdict(set)
LAB=re.compile(r'^([A-Za-z_]\w*):')
TOK=re.compile(r'\b([A-Za-z_]\w*)\b')
for f in glob.glob('src/**/*.asm',recursive=True):
    if '/data/' in f: continue
    cur=None
    for l in open(f,encoding='latin1'):
        m=LAB.match(l)
        if m:
            lb=m.group(1)
            if not re.search(r'_[0-9A-F]+$',lb): cur=lb
            continue
        code=l.split(';',1)[0]
        if not code.strip() or code.lstrip().startswith(('global','extern')): continue
        for t in TOK.findall(code): refs[t].add(cur)
def clean(e):
    e=IDA.sub(lambda m: addr2name.get(m.group(1),'@@'),e)
    if '@@' in e or LIN.search(e) or RAW.search(e) or HIST.search(e): return None
    return e.strip().rstrip('.')
def users(n,k=3):
    u=sorted(x for x in refs.get(n,()) if x and x!=n)
    if not u: return ''
    return ', '.join(u[:k])+(' ...' if len(u)>k else '')
out=subprocess.run(['python3','tools/build/check_comments.py','--rule','data'],capture_output=True,text=True).stdout
todo=collections.defaultdict(dict)
for l in out.split('\n'):
    m=re.match(r'^(\S+):(\d+): \[data\] data label (\S+) has no comment',l)
    if m: todo[m.group(1)][int(m.group(2))]=m.group(3)
stat=collections.Counter()
W=110; COL=48
def wrap(head,text):
    # head = label line code; text = comment body
    lines=[];cur=''
    ws=[]
    for w in text.split():
        while len(w)>W-COL-2: ws.append(w[:W-COL-2]); w=w[W-COL-2:]
        ws.append(w)
    for w in ws:
        if len(cur)+len(w)+1>W-COL-2 and cur: lines.append(cur); cur=w
        else: cur=(cur+' '+w).strip()
    if cur: lines.append(cur)
    pad=lambda c: c+' '*max(1,COL-len(c)) if len(c)<COL else c+' '
    res=[pad(head)+'; '+lines[0]]
    for x in lines[1:]: res.append(' '*COL+'; '+x)
    return res
def decode(L,n):
    b=[]
    for l in L[n-1:n+12]:
        c=l.split(';',1)[0]
        if l is not L[n-1] and LAB.match(l): break
        m=re.search(r'\bdb\s+(.*)$',c)
        if not m: 
            if l is L[n-1]: continue
            break
        for t in m.group(1).split(','):
            t=t.strip()
            try: v=int(t[:-1],16) if t.endswith('h') else int(t)
            except: return None
            if v==0: return ''.join(b)
            if 32<=v<127 and chr(v)!='"': b.append(chr(v))
            elif v in (10,13): b.append(' ')
            else: return None
    return ''.join(b) if b else None
samples=[]
for f,d in todo.items():
    L=open(f,encoding='latin1').read().split('\n')
    for n in sorted(d,reverse=True):
        name=d[n]; r=ev.get(name); e=clean(r['evidence']) if r else None
        u=users(name)
        if e:
            stat['ev']+=1
            if u and 'used by' not in e: e+='; used by '+u
        else:
            stat['fallback']+=1
            fm=re.match(r'^F(32|64|80)_(neg)?([0-9a-z]+?)(?:_|$)',name)
            if name.endswith('JumpTable'): e='jump table for the switch cases'+(' of '+u if u else '')
            elif fm:
                v=('-' if fm.group(2) else '')+fm.group(3).replace('p','.')
                e={'32':'float','64':'double','80':'80-bit'}[fm.group(1)]+' constant '+v+('; used by '+u if u else '')
            elif name.startswith('str_'):
                st=decode(L,n)
                e=('string "%s"'%st if st is not None else 'string')+('; used by '+u if u else '; not referenced by name')
            elif u: e='used by '+u
            else: e='not referenced by name (reached through a neighbouring label or a table)'
        line=L[n-1].rstrip()
        L[n-1:n]=wrap(line,e)
        if len(samples)<40 and stat['fallback']%200==1: samples.append(L[n-1])
    if '--write' in sys.argv: open(f,'w',encoding='latin1').write('\n'.join(L))
print(stat)
for s in samples[:15]: print(s)
