- **Notes**
	- `cargo` - build tool (like [Swift Package Manager](Swift%20Package%20Manager.md))
		```bash
		cargo new <project_name>
		cargo build
		cargo run
		cargo check # check for errors, faster then compiling whole app
		cargo update
		```
	- [libraries should ignore `Cargo.lock` but binaries/applications should check-in `Cargo.lock`](https://doc.rust-lang.org/cargo/faq.html#why-do-binaries-have-cargolock-in-version-control-but-not-libraries)
- **Links**
	- [The Manifest Format - The Cargo Book](https://doc.rust-lang.org/cargo/reference/manifest.html)

