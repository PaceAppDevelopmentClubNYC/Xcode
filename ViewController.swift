

import UIKit

class ViewController: UIViewController {
    
    // This code has been written primarly for iphone5s. It can be run on other versions of iphone however the screen will not look like a custom fit. There are ways of making it compatible for all other iphone sizes however that is more a bit more advance and the meeting was focused on getting the basics down with Xcode.
    
    var numberOnScreen:Double = 0; // This is the current number on display in the calculator.
    
    var previousNumber:Double = 0; // This number is to hold the value of the first number that was clicked aka after you click the first number you then click the second but you need to hold onto the first number that was clicked which is this variable.
    
    var performingMath = false // This is variable that says true if we clicked on a "+","-","x" or "/"
    
    var operation = 0; // This variable keeps track of which "+","-","+" and "/" we clicked on aka stores the tag/id value.
  
    
    @IBOutlet weak var label: UILabel! //  This is the label object that displays the numbers for the calculator.
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true{ // If we clicked on a "+","-","/" or "*"
    
            
    // label.text access the text in the label and String(sender.tag-1) retrives the id of the number that was pressed and minueses it by one. 0 has an id of one and 1 has an id of 2 and so on. We are simply retrieveing what number was pressed and casting it to a String with the String() function.
            label.text = String(sender.tag-1);
            
    //numberOnScreen is retrieveing the number in the text are aka the black part of the calculator and converting it to a Double wit the Double().
            numberOnScreen = Double(label.text!)!;
            
    //This simply asks did we click on a "+","-","x" or "/" and the answer is no because this is only when a number is clicked and by default performingMath is set to false until one of those buttons is pressed.
           performingMath = false
            
        }else{
            
    // This is when we did not press a math symbol. So in other words the first number pressed into the calculator. Again the text in the label is set to equal the tag-1 of which ever number was pressed. It's converted into a string cause text is a String and can't except just numbers.
            label.text = label.text! + String(sender.tag - 1);
            
    //This converts the the label.text that we set in the line before back into a number. Specifically a Double in the numberOnScreen variable so that we can minpulate it later on. 
       numberOnScreen = Double(label.text!)!
            
            
        }
        
        
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
       //This checks that the "+","-","x" or "/" are pressed and that you don't have nothning in the text label aka "". You are not pressing the "=" button and you are not pressing the "c" button. Only the "+","-","x" or "/"
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            
            
            //This sets previousNumber equal to the number inside the label.text. Holds onto the number so we don't lose it.
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12{ // 12 is the tag for Divide were checking if were dividing.
                
                // This is so that when you press the division button the division sign pops up on the screen.
                label.text = "/";
                
            }else if sender.tag == 13{// 13 is the tag for Multiply were checking if were multipling.
                
               // This is so that when you press the multiplication button the multiplication sign pops up on the screen.
                label.text = "x";
                
            }else if sender.tag == 14{// 14 is the tag for subtraction were checking if were substracting.
                
                // This is so that when you press the subtracting button the "-" sign pops up on the screen.
                label.text = "-";
                
            }else if sender.tag == 15{// 15 is the tag for addition were checking if were adding.
             
                // This is so that when you press the addition button the "+" sign pops up on the screen.
                label.text = "+";
                
            }
            // operation is set to the tag we pressed meaning it is keeping track of which mathematical operation we are going to be doing.
            operation = sender.tag
            
            // Since we are doing a mathematical operation we are "performingMath" therefore we are setting that equal to true.
            performingMath = true;
            
        // This checks to see if we pressed the "=" button
        }else if sender.tag == 16{
            
            if operation == 12{ // checking if our operation is going to be division.
                
                // Sets the screen to the number where the previousNumber aka the first number and the second number aka the number that is on screen to the number where previousNumber is divided by the numberOnScreen. aka the result.
                label.text = String(previousNumber / numberOnScreen);
                
            }else if operation == 13{// checking if our operation is going to be multiplication.
                
                // Sets the screen to the number where the previousNumber aka the first number and the second number aka the number that is on screen to the number where previousNumber is multiplied by the numberOnScreen. aka the result.
                label.text = String(previousNumber * numberOnScreen);
                
            }else if operation == 14{// checking if our operation is going to be subtraction.
                
                // Sets the screen to the number where the previousNumber aka the first number and the second number aka the number that is on screen to the number where previousNumber is subtracted by the numberOnScreen. aka the result.
                label.text = String(previousNumber - numberOnScreen);
                
            }else if operation == 15{// checking if our operation is going to be addition.
                
                // Sets the screen to the number where the previousNumber aka the first number and the second number aka the number that is on screen to the number where previousNumber is added by the numberOnScreen. aka the result.
                label.text = String(previousNumber + numberOnScreen);
                
            }
            
        // This checks to see if we pressed the clear button "c"
        }else if sender.tag == 11{
            
            // Sets the screen equal to ""
            label.text = ""
            
            // sets previousNumber equal to zero.Totally erases the past value.
            previousNumber = 0;
            
            // sets numberOnScreen equal to zero.Totally erases the past value like with previousNumber.
            numberOnScreen = 0;
            
            // sets operation equal to zero like before totally erases the past operation like the other 2 vars.
            operation = 0;
            
        }
    }
    
    // These functions "viewDidLoad" and "didRecieveMemoryWarning" come by default for any project incase any exceptions arise while compiling and running the app.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

