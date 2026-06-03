````md
# PlainSight ✨
**Text Cleanup for Humans (and Search Engines)**

PlainSight is a small but seriously handy Python tool that strips out “smart” typography and odd hidden characters that sneak into modern text. If you’ve ever pasted something from ChatGPT, Word, Google Docs, PDFs, or a website and then found your keywords don’t match, your grep misses stuff, or formatting goes weird, this fixes it.

It’s built for two things:
- **Clean text so it behaves** (searchable, consistent, copy/paste friendly)
- **Remove the usual giveaway symbols** (smart quotes, long dashes, ellipses, bullet dots, and other junk)

You get both:
- **CLI mode** for batch cleaning files and folders
- **Web UI** for quick copy/paste cleanups in the browser

---

## Why PlainSight?

Because these characters look normal… but they aren’t.
They can:
- break keyword matching (`—` vs `-`, `…` vs `...`)
- cause annoying diffs in git / PR reviews
- mess up systems that expect plain punctuation
- make content inconsistent across platforms

PlainSight makes your text predictable again.

---

## What it changes

`cleanup()` currently applies these normalisations:

- `–` → `-`
- `—` → `, `
- ` —` → `,`
- `“` / `”` → `"`
- `’` → `'`
- `…` → `...`
- `•` → `*`
- `<2060> <2060>` (with whitespace) → ` `

You can add more rules easily by editing the `cleanup()` function.

---

## Requirements

- Python 3 (recommended 3.9+)

Only needed for the **web UI**:
- `streamlit`

CLI mode has no third-party dependencies.

---

## Install

Grab the script, then (optional but recommended) create a venv:

```bash
python3 -m venv venv
source venv/bin/activate
````

Install Streamlit if you want the web interface:

```bash
pip install streamlit
```

---

## Usage (CLI)

### Clean files in place

```bash
./app.py file.txt
```

Multiple files:

```bash
./app.py file1.txt file2.txt
```

### Clean directories recursively (in place)

```bash
./app.py dir1 dir2
```

Notes:

* it walks directories recursively
* it skips hidden entries (anything starting with a dot)

### Clean stdin to stdout

```bash
cat file.txt | ./app.py
```

Or:

```bash
./app.py < file.txt
```

---

## Usage (Web UI)

Launch the Streamlit UI:

```bash
./app.py --web
```

Then open the local URL shown in the terminal (usually `http://localhost:8501`).

Workflow:

1. paste text into the left box
2. click **Clean**
3. copy cleaned output from the right box

---

## How it edits files (safe-ish overwrites)

When cleaning a file, PlainSight writes a temp file next to it:

* `yourfile.txt.new`

Then it replaces the original via `os.replace()`.

So it avoids half-written files, but it **does overwrite the original**. If it matters, commit first or keep a backup.

---

## Customising the rules

Edit this part of `app.py`:

```py
def cleanup(text: str) -> str:
    ...
```

Quick tips:

* `re.sub()` is perfect for symbol swaps
* file cleaning runs line-by-line, stdin/web runs as a whole string

---

## Troubleshooting

### Web page loads but output stays blank

* click **Clean**
* refresh the page or press `R` in Streamlit to rerun
* confirm Streamlit is installed in the same venv you’re running the script from

### “Streamlit is not installed”

Install it:

```bash
pip install streamlit
```

---

## Licence

Add whatever licence you want here (MIT, Apache-2.0, etc.).

```
::contentReference[oaicite:0]{index=0}
```

