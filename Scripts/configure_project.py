from pathlib import Path
import sys
repo=Path(__file__).resolve().parents[1]
data=(repo/'Data').resolve()
target=repo/'Dashboard'/'RetailPulse.SemanticModel'/'definition'/'expressions.tmdl'
text=target.read_text(encoding='utf-8')
path=str(data).replace('\\','\\\\')
import re
text=re.sub(r'expression DataRoot = ".*?" meta', f'expression DataRoot = "{path}" meta', text)
target.write_text(text,encoding='utf-8')
print(f'Configured DataRoot: {data}')
