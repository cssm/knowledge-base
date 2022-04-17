# Avoiding mistakes in software localization

## Content

1. Do not hardcode text that should be localized. Use locaization files instead
2. Make shure that your UI is adaptive to different locales.
    
    Add an exta spacing to labels so that they able to grow
    
3. Always use full localt (Country + language)
4. Do not concatenate strings in code. Use provided tools in localization files for that
5. Always use UTF-8
6. Do not hardcode dates, units, numbers etc.
7. Care about vertical written languages and languages that read from right to left
8. Do not use images with hardcoded text in it. Generate images from localized text
9. Localize erly. Ideal is to localize

## Resources

[https://phrase.com/blog/posts/10-common-mistakes-in-software-localization/](https://phrase.com/blog/posts/10-common-mistakes-in-software-localization/)