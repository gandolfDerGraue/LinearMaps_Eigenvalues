
  
  float a=1, b=0, c=0, d=1;
  Point [][] k=new Point[20][20];
  boolean ani=false;
  boolean eigen=false;
  void setup() {
    size(800, 600);
  }
  void draw() {
    //Hintergrund
    strokeWeight(1);
    background(0, 100, 100);
    stroke(255);
    line(82, 0, 82, height);
    noFill();
   
   //Achsen
    strokeWeight(4);
    stroke(0);
    line(82,height/2,width,height/2);
    line(width/2+41,0,width/2+41,height);
    
    //verschobenes koordianatensystem
    for(int i=-10;i<10;i++){
      for(int j=-10;j<10;j++){
        float aa=a;
        float bb=b;
        float cc=c;
        float dd=d;
        if(ani){
          aa=map(mouseX,0,width,1,a);
          bb=map(mouseX,0,width,0,b);
          cc=map(mouseX,0,width,0,c);   
          dd=map(mouseX,0,width,1,d);
        } 
        if(eigen){
        aa=aa+map(mouseX,82,width,3,-3);
        dd=dd+map(mouseX,82,width,3,-3);
        }
        //punkte wo die linien durchgehen
        k[i+10][j+10]=new Point(aa*i+bb*j,cc*i+dd*j);
      }
    }
    pushMatrix();
    translate(width/2+41, height/2);
    strokeWeight(1);
    for(int i=2;i<19;i++){
     for(int j=2;j<19;j++){
       line(k[i][j].x,-k[i][j].y,k[i-1][j].x,-k[i-1][j].y);
       line(k[i][j].x,-k[i][j].y,k[i+1][j].x,-k[i+1][j].y);
       line(k[i][j].x,-k[i][j].y,k[i][j-1].x,-k[i][j-1].y);
       line(k[i][j].x,-k[i][j].y,k[i][j+1].x,-k[i][j+1].y);
     }
    }
    //einheitsvektoren
    stroke(255,0,0);
    line(k[10][10].x,-k[10][10].y,k[11][10].x,-k[11][10].y);
    stroke(0,255,0);
    line(k[10][10].x,-k[10][10].y,k[10][11].x,-k[10][11].y);
    stroke(0);
    
    //eigenvektors
    double eigenX1,eigenY1,eigenX2,eigenY2;
    double t1=(a+d)/2+Math.sqrt((a+d)*(a+d)/4-a*d+c*b);
    double t2=(a+d)/2-Math.sqrt((a+d)*(a+d)/4-a*d+c*b);

    int countZero=0;
    if(a==0)countZero++;
    if(b==0)countZero++;
    if(c==0)countZero++;
    if(d==0)countZero++;
    if(countZero<2){
      
      if(a==0){
        eigenY1=3;
     
       
    }
   
    
    }
    
    popMatrix();
    
    //matrix
    fill(0,100,100);
    rect(0,0,82,height);
    noFill();
    rect(20, 20, 20, 20);
    rect(42, 20, 20, 20);
    rect(42, 42, 20, 20);
    rect(20, 42, 20, 20);
    fill(0);
    text((int)(a),25,35);
    text((int)(b),47,35);
    text((int)(c),25,57);
    text((int)(d),47,57);
    noFill();
    if(ani)fill(0);
    rect(20,100,42,42);
    
    noFill();
    rect(20,150,42,42);
    
    if(eigen){
      float t=-map(mouseX,82,width,3,-3);
      text(t,20,207);
      text((int)((a-t)*10),25,165);
      text((int)(b*10),45,165);
      text((int)(c*20),25,187);
      text((int)((d-t)*10),45,187);
    }
  }
  void mousePressed() {
    switch(isover(mouseX,mouseY)){
    case 1:a=-a;
    break;
    case 2:b=-b;
    break;
    case 3:c=-c;
    break;
    case 4:d=-d;
    break;
    case 5:ani=(ani==false)?true:false;
    break;
    case 6:eigen=(eigen==false)?true:false;
    }
  }
  
  void keyPressed(){
    int number;
    try{
      number=Integer.parseInt(key+"");
    }
     catch(NumberFormatException e)
     {
       return;
     }
    switch(isover(mouseX,mouseY)){
    case 1:a=number;
    break;
    case 2:b=number;
    break;
    case 3:c=number;
    break;
    case 4:d=number;
    }
  }
  
  
  int isover(float x, float y) {
    if (x>20 && x<40 && y>20 && y< 40)return 1;
    if (x>42 && x<62 && y>20 && y< 40)return 2;
    if (x>20 && x<40 && y>42 && y< 62)return 3;
    if (x>42 && x<62 && y>42 && y< 62)return 4;
    if (x>20 && x<62 && y>100 && y< 142)return 5;
     if (x>20 && x<62 && y>150 && y< 192)return 6;
    return 0;
  }
