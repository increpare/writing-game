import haxegon.*;

class Main {
	static inline var cellw = 28;
	static inline var cellh = 19;

	var px:Int=cellw*5;
	var py:Int=cellh*13;

	var cellwmid:Int;
	var cellhmid:Int;

	var gridw = 11;
	var gridh = 25;

	var tilemap:Array<Int> = [
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,1,1,1, 1,1,1, 1,1,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,1,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,1,1, 1,0,1, 1,1,1,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 1,0,1, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 1,0,1, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 1,0,1, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
	];

	var firegx=4;
	var firegy=4;

	var watergx=5;
	var watergy=6;

	var brushgx=7;
	var brushgy=8;

	var maph:Int;
	var mapw:Int;

	var screenw:Int;
	var screenh:Int;

	var pw:Int;
	var ph:Int;

	var pwmid:Int;
	var phmid:Int;

	var poffsetx:Int;
	var poffsety:Int;

	var dx=0;
	var dy=0;

	// new() is a special function that is called on startup.
	function new() {
		cellwmid=Convert.toint(cellw/2);
		cellhmid=Convert.toint(cellh/2);
		Gfx.resizescreen(308,228);	
		Gfx.loadimage("bgtiles");
		Gfx.loadimage("book_blank_l");
		Gfx.loadimage("book_blank_r");
		Gfx.loadimage("book_cover");		
		Gfx.loadimage("book_covermask");		
		Gfx.loadimage("book_default_l");
		Gfx.loadimage("book_default_r");
		Gfx.loadimage("book_rewritten_l");
		Gfx.loadimage("book_rewritten_r");
		Gfx.loadimage("book_scored_l");
		Gfx.loadimage("book_scored_r");
		Gfx.loadimage("bookframe");
		Gfx.loadimage("brush");
		Gfx.loadimage("fg");
		Gfx.loadimage("firepit");
		Gfx.loadimage("firepit2");
		Gfx.loadimage("player");
		Gfx.loadimage("playerwalk1");
		Gfx.loadimage("playerwalk2");
		Gfx.loadimage("smallbook");
		Gfx.loadimage("waterpit");
		Gfx.loadimage("waterpit2");	
		maph=Gfx.imageheight("bgtiles");
		mapw=Gfx.imagewidth("bgtiles");
		pw=Gfx.imagewidth("player");
		ph=Gfx.imageheight("player");
		
		pwmid=Convert.toint(pw/2);
		phmid=Convert.toint(ph/2);
		poffsetx=Convert.toint(cellw/2-pwmid);
		poffsety=Convert.toint(cellh-ph-phmid+1);
		screenw=252;
		screenh=228;
		Gfx.showfps=true;
	}
	
	function checkCollision(tx:Int,ty:Int):Bool{			
		trace(tx+","+ty);
	  	if (tx<0||tx>=gridw||ty<0||ty>=gridh||tilemap[tx+gridw*ty]==1){  		
	  		dx=0;
	  		dy=0;
	  		return true;
	  	}
	  	return false;
	}

  var showbook:Bool=false;
  var showtext:String="";
  var showtextframe:Int=0;
  var bookframe:Int=0;
  var bookanimspeed = 1;  
  var initbookpause=5;
  function DrawBook(){
  	var f:Int=Convert.toint(bookframe/bookanimspeed);
  	var bookwmid=Convert.toint(Gfx.imagewidth("book_cover")/2);
  	var bookhmid=Convert.toint(Gfx.imageheight("book_cover")/2);
  	var bookoffset = f;
  	if (bookoffset>=bookwmid){
  		bookoffset=bookwmid;
  	}
  	  
  	Gfx.drawimage(Gfx.CENTER,Gfx.CENTER,"bookframe");

  	var f2:Float=Convert.tofloat(f)/bookwmid;
  	if (f2>1){  		
  		var f3 = f2-1;
  		if (f3>1){
  			f3=1;
  		}  		
  		trace(f3);
  		var lpagew=Gfx.imagewidth("book_default_l");
  		var lpagewmid=Convert.toint(lpagew/2);

  		var bookoffset2 = f3*lpagewmid;
  		
  		Gfx.scale(f3,1);
  	  	Gfx.drawimage(Gfx.CENTER-bookoffset2+1,Gfx.CENTER,"book_default_l");
  	  	Gfx.scale(1,1);

	  	Gfx.drawimage(Gfx.CENTER+bookoffset-1,Gfx.CENTER,"book_default_r");

  	} else {
	  	Gfx.drawimage(Gfx.CENTER+bookoffset-1,Gfx.CENTER,"book_default_r");

	  	Gfx.scale(1-f2,1);
	  	Gfx.drawimage(Gfx.CENTER,Gfx.CENTER,"book_cover");
	  	Gfx.scale(1,1);
  	}
  	initbookpause--;
  	if (initbookpause<=0){
  		bookframe++;
  	}
  	
  }

  function DrawTextBox(){
  	var s = showtext;

	var height = 10;
 	Text.changesize(height);
  	var width = Convert.toint(Text.len(s));  	
	var margin=2;
  	showtextframe++;

  	if (showtextframe<15) {
  		width = Convert.toint(Convert.tofloat(width*showtextframe)/15);
	  	Gfx.fillbox(Gfx.screenwidthmid-width/2-margin-1,Gfx.screenheightmid-height/2-margin-1,width+margin*3+2,height+margin*2+2,0xffffff);
	  	Gfx.fillbox(Convert.toint(Gfx.screenwidthmid-width/2-margin),Convert.toint(Gfx.screenheightmid-height/2-margin),width+margin*3,height+margin*2,0x000000);
  	} else {
	  	Text.align(Text.CENTER);
	  	Gfx.fillbox(Gfx.screenwidthmid-width/2-margin-1,Gfx.screenheightmid-height/2-margin-1,width+margin*3+2,height+margin*2+2,0xffffff);
	  	Gfx.fillbox(Convert.toint(Gfx.screenwidthmid-width/2-margin),Convert.toint(Gfx.screenheightmid-height/2-margin),width+margin*3,height+margin*2,0x000000);
	  	Text.display(Gfx.screenwidthmid-margin,Gfx.screenheightmid-height,s);
	  }
  }

	var t:Int=0;
  function update() {
  	t++;
  	var tx=Convert.toint(px/cellw);
  	var ty=Convert.toint(py/cellh);
  	var frame=0;
  	if (px%cellw!=0||py%cellh>1){
  		frame=Convert.toint((px+py)/10)%2;
  		frame++;
  	}
  	if (px%cellw==0){
  		dx=0;
  	}

  	if (py%cellh==0||py%cellh==1){
  		dy=0;
  	}

  	if (px%cellw==0&&(py%cellh==0||py%cellh==1)){		
  		if (Input.pressed(Key.UP)){
  			dy=-1;
  			if (checkCollision(tx,--ty)){
  				ty++;
  			}
  		}
  		if (Input.pressed(Key.DOWN)){
  			dy=1;
  			if (checkCollision(tx,++ty)){
  				ty--;
  			}
  		}
  		if (Input.pressed(Key.LEFT)){
  			dx=-1;
  			if (checkCollision(--tx,ty)){
  				tx++;
  			}
  		}
  		if (Input.pressed(Key.RIGHT)){
  			dx=1;
  			if (checkCollision(++tx,ty)){
  				tx--;
  			}
  		}
  	}
 	px+=2*dx;
  	py+=2*dy;

  	var offy:Int=Gfx.screenheightmid-cellhmid-py;
  	var maxoffy=maph-screenh;
  	if (-offy>maxoffy){
  		offy=-maxoffy;
  	}
  	Gfx.drawimage(0,offy,"bgtiles");
  	Gfx.drawimage(0,offy,"fg");

  	Gfx.drawimage(179+28*2,134+2*19+offy,"brush");
  	if ((t/10)%2<1){
  		Gfx.drawimage(85,77+offy,"waterpit");
  		Gfx.drawimage(141+2*28,71+offy,"firepit");
  	} else {
  		Gfx.drawimage(85,77+offy,"waterpit2");  		
  		Gfx.drawimage(141+2*28,71+offy,"firepit2");
  	}
  	if (frame==0){
  		Gfx.drawimage(px+poffsetx,py+poffsety+offy,"player");
  	} else {
  		Gfx.drawimage(px+poffsetx,py+poffsety+offy,"playerwalk"+frame);
  	}

	Gfx.drawimage(122+28,106+19+offy,"smallbook");


  if (showbook){
  	DrawBook();
  }
  if (showtext.length>0){
  	DrawTextBox();
  }
  }

}