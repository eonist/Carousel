import UIKit

class Card:Item{
   var color:UIColor
   lazy var textField:UITextField = {
      let textField = UITextField.init(frame: self.frame)
      textField.text = "Idx: \(idx)"
      addSubview(textField)
      textField.textColor = .black
      textField.textAlignment = .center
      textField.font = .boldSystemFont(ofSize: 16)
      return textField
   }()
//   override var idx: Int  {
//      get {
//         return super.idx
//      }set {
//         super.idx = newValue
//      }
//   }
   init(color:UIColor, idx:Int, frame: CGRect) {
      self.color = color
      super.init(idx:idx, frame: frame)
      backgroundColor = self.color
      _ = textField
   }
   override func appeared() {
      textField.text = "Idx: \(idx)"
   }
   override func disappeared() {
      //
   }
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
