import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var numberField1: UITextField!
    @IBOutlet weak var numberField2: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial values and event handlers
        operationLabel.text = "Least Common Divisor"
        switchControl.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }

    @objc func switchValueChanged() {
        if switchControl.isOn {
            operationLabel.text = "Greatest Common Denominator"
        } else {
            operationLabel.text = "Least Common Divisor"
        }
    }

    @objc func calculateButtonTapped() {
        // Check if the text in the textFields can be converted to integers
        if let number1 = Int(numberField1.text ?? ""), let number2 = Int(numberField2.text ?? "") {
            if switchControl.isOn {
                // Calculate GCD
                let gcd = greatestCommonDenominator(a: number1, b: number2)
                resultLabel.text = "Result: \(gcd)"
            } else {
                // Calculate LCM
                let lcm = leastCommonDivisor(a: number1, b: number2)
                resultLabel.text = "Result: \(lcm)"
            }
        } else {
            // Invalid input, turn textFields red
            numberField1.backgroundColor = UIColor.red
            numberField2.backgroundColor = UIColor.red
            resultLabel.text = "Result: Invalid Input"
        }
    }

    // Function to calculate Greatest Common Denominator (GCD)
    func greatestCommonDenominator(a: Int, b: Int) -> Int {
        return b == 0 ? a : greatestCommonDenominator(a: b, b: a % b)
    }

    // Function to calculate Least Common Divisor (LCM)
    func leastCommonDivisor(a: Int, b: Int) -> Int {
        return a * b / greatestCommonDenominator(a: a, b: b)
    }
}
