
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {
  int segX;
  int segY;
  //2. Create x and y member variables to hold the location of each segment.
  
  // 3. Add a constructor with parameters to initialize each variable.
  Segment(int x, int y) {
    segX = x;
    segY = y;
  }

  // 4. Add getter and setter methods for both the x and y member variables.
  int getX() {
    return segX;
  }
  
  void setX(int x) {
    segX = x;
  }
  
  int getY() {
    return segY;
  }
  
  void setY(int y) {
    segY = y;
  }
  
}


// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
Segment head;


// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
String direction = "up";


// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int score = 0;


// 8. Create and initialize foodX and foodY variables to hold the location of the food.
int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

//int foodX = ((int)random(50)*10);



void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
head = new Segment(250,250);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}


void draw() {

  background(0);


  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
  
  text("Score: " + score, 10,20);
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  rect(foodX,foodY,10,10);
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  rect(head.getX(),head.getY(),10,10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  
  switch(direction) {
  case "up":
    // move head up here 
    head.setY(head.getY()-10);
    break;
  case "down":
    // move head down here 
    head.setY(head.getY()+10);
    break;
  case "left":
   // figure it out 
   head.setX(head.getX()-10);
    break;
  case "right":
    // mystery code goes here 
    head.setX(head.getX()+10);
    break;
  }
  


  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP && direction == "down") {
      
    }
    else if(keyCode == UP) {
      direction = "up";
    }
    if(keyCode == DOWN && direction == "up") {
      
    }
    else if(keyCode == DOWN) {
      direction = "down";
    }
    if(keyCode == LEFT && direction == "right") {
      
    }
    else if(keyCode == LEFT) {
      direction = "left";
    }
    if(keyCode == RIGHT && direction == "left") {
      
    }
    else if(keyCode == RIGHT) {
      direction = "right";
    }
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if (head.getX() < 0) {
    head.setX(500);
  }
  else if (head.getY() < 0) {
    head.setY(500);
  }
  else if (head.getX() > 500) {
    head.setX(0);
  }
  else if (head.getY() > 500) {
    head.setY(0);
  }
  
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)

//done


// 21. Complete the missing parts of the collision method below.

void collision() {

  // If the segment is colliding with a piece of food...
  if(foodX == head.getX() && foodY == head.getY()) {
    score = score + 1;
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
  }
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)

ArrayList<Segment> segments = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.



void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  checkTailCollision();
  drawTail();
  
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  segments.add(new Segment(head.getX(),head.getY()));
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  while(segments.size() > score) {
    segments.remove(0);
    print(segments.size());
  }

}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    
    for(Segment seg:segments) {
      rect(seg.getX(),seg.getY(),10,10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  for (int i = 0; i < segments.size(); i = i+1) {
      if(head.getX() == segments.get(i).getX() && head.getY() == segments.get(i).getY()) {
        score = 0;
      }
   }

  // reset your food variable

  //Call this method at the beginning of your manageTail method.
}