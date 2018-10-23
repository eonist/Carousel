import UIKit

class Card2:Item{
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
   override var idx: Int  {
      get {
         return super.idx
      }set {
         super.idx = newValue
         textField.text = "Idx: \(idx)"
      }
   }
   init(color:UIColor, idx:Int, frame: CGRect) {
      self.color = color
      super.init(idx:idx, frame: frame)
      backgroundColor = self.color
      _ = textField
   }
 
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
