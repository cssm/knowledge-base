- **Links**
	- [Unicode and You – BetterExplained](https://betterexplained.com/articles/unicode/)
	- [Emoji under the hood @ tonsky.me](https://tonsky.me/blog/emoji/)
- **Notes**
	- Unicode is just a concept of code points
	- Main difference that Unicode itself do not say anything about how it stores it symbols (like ASCII) it just describes a concept of symbol
	- *Code Point*
		- `U+03423` (◌͂)
			- Where 
				- `U` - Unicode
				- 03423 - Hexadecimal representation
	- *UTF-8*
		- UTF-8 encoding uses first bits to indicate how many bytes in sequence
		- Bytes starting with 10… are “data” bytes and contain information for the codepoint. A 2-byte example looks like this: `110xxxxx 10xxxxxx`
	- *Emojis*
		- Meet `Grapheme Clusters`. `Grapheme cluster` is a sequence of code points that is considered a single human-perceived glyph. `Grapheme Clusters` were not invented just for emoji, they apply to normal alphabets too. `Ü` is a single grapheme cluster, even though it’s composed of two code points: `U+0055 UPPER-CASE U` followed by `U+0308 COMBINING DIAERESIS`.
		- To sum up, these are seven ways emoji can be encoded:
			1. A single codepoint 🧛 U+1F9DB	
			2. Single codepoint + variation selector-16 ☹︎ U+2639 + U+FE0F = ☹️	
			3. Skin tone modifier 🤵 U+1F935 + U+1F3FD = 🤵🏽		
			4. Zero-width joiner sequence 👨 + ZWJ + 🏭 = 👨‍🏭		
			5. Flags 🇦 + 🇱 = 🇦🇱		
			6. Tag sequences 🏴 + gbsct + U+E007F = 🏴󠁧󠁢󠁳󠁣󠁴󠁿		
			7. Keycap sequences * + U+FE0F + U+20E3 = *️⃣				
		- Techniques from 1-4 can be combined to construct a pretty complex message: `U+1F6B5` 🚵 Person Mountain Biking + `U+1F3FB` Light Skin Tone + `U+200D` ZWJ + `U+2640` ♀️Female Sign + `U+FE0F `Variation selector-16 = 🚵🏻‍♀️ Woman Mountain Biking: Light Skin Tone