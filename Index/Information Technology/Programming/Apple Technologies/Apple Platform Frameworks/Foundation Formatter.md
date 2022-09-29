```swift
final class CardNumberFormatter: Formatter {
  
  private var cardNumberFormat: () -> String = { "XXXX XXXX XXXX XXXX" }
  
  private var numberSymbol: Character = "X"
  
  private lazy var formatResult = cardNumberFormat()
  
  @discardableResult
  func cardNumberFormat(_ format: @escaping @autoclosure () -> String) -> Self {
    cardNumberFormat = format
    return self
  }
  
  func updateCardNumber(_ newNumber: Int) {
    var chunks = formatResult.components(separatedBy: .whitespaces)
    for (i, chunk) in zip(chunks.indices, chunks) {
      guard let fIndex = chunk.firstIndex(of: numberSymbol) else { continue }
      let lIndex = chunk.index(after: fIndex)
      var mutChunk = chunk
      mutChunk.replaceSubrange(fIndex..<lIndex, with: String(newNumber))
      chunks[i] = mutChunk
      break
    }
    formatResult = chunks.joined(separator: " ")
  }
  
  override func string(for obj: Any?) -> String? {
    guard
      let number = obj as? String,
      CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: number))
    else { return nil }
    
    _ = number
      .compactMap(String.init)
      .compactMap(Int.init)
      .map(updateCardNumber)
    
    let result = formatResult
    formatResult = cardNumberFormat()
    return result
  }
  
}
```