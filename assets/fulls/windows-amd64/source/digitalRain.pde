int numDrops = 1000;
float speed = 2;
float[][] drops;
int[] dropValues;
float spacing = 10; // 设置数字之间的间隔

void setup() {
  size(800, 600);
  background(0);
  smooth();
  
  drops = new float[numDrops][2];
  dropValues = new int[numDrops];
  
  for (int i = 0; i < numDrops; i++) {
    drops[i][0] = random(width);
    drops[i][1] = random(-height, height);
    dropValues[i] = int(random(2));
  }
}

void draw() {
  background(0);
  fill(0, 255, 0);
  textSize(12);
  
  for (int i = 0; i < numDrops; i++) {
    drops[i][1] += speed;
    
    if (drops[i][1] > height) {
      drops[i][0] = random(width);
      drops[i][1] = random(-20, 0);
    }
    
    float alpha = map(drops[i][1], height/2, height, 255, 0);
    fill(0, 255, 0, alpha);
    
    // 将绘制位置向下偏移spacing像素，避免重叠
    text(dropValues[i], drops[i][0], drops[i][1] + spacing * (i % 10)); 
  }
}
