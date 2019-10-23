class Node{
 int xpos,ypos;
 Node(int x, int y){
  this.xpos = x;
  this.ypos = y;
 }
 int getX(){
  return this.xpos; 
 }
 int getY(){
   return this.ypos;
 }
 void display(){
   fill(color(100,xpos*10,ypos*10));
   ellipse(xpos,ypos,10,10);
 }
}

class Connections{
 ArrayList<Node> left,right;
 Connections(){
  this.left = new ArrayList<Node>();
  this.right = new ArrayList<Node>();
 }
 void addConnection(Node left, Node right){
   this.left.add(left);
   this.right.add(right);
 }
 void removeConnection(Node left, Node right){
   for(int i = 0;i<this.left.size();i++){
     if(this.left.get(i)==left &&this.right.get(i)==right){
       this.left.remove(i);
       this.right.remove(i);
     }
   }
 }
 void display(){
   fill(color(0,0,0));
   for(int i = 0;i<this.left.size();i++){
     Node l = this.left.get(i);
     Node r = this.right.get(i);
     line(l.getX(),l.getY(),r.getX(),r.getY());
   }
 }
}
static boolean applyConnection = false;
ArrayList<Node> nodes;
Connections connect;
void setup(){
  background(255);
  size(500,500);
  connect = new Connections();
  nodes = new ArrayList<Node>();
}

void draw(){
  connect.display();
  for(Node node:nodes){
     node.display();
  }
}

void mousePressed(){
  Node node = new Node(mouseX,mouseY);
  nodes.add(node);
  if(applyConnection){
    connect.addConnection(node,nodes.get(nodes.size()-2));
    println("connected");
  }
  applyConnection = !(applyConnection);
  
}
