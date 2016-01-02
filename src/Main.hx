import haxegon.*;

class Main {
	static inline var cellw = 28;
	static inline var cellh = 19;


	var cellwmid:Int;
	var cellhmid:Int;

	var gridw = 11;
	var gridh = 23;

	var haskey :Bool=false;
	var unlocked :Bool=false;
	var pedastalbook :Bool=true;
	var pedastalbrush :Bool=false;
	var floorbook :Bool=false;
	var floorbrush :Bool=true;
	var waterbook : Bool=false;
	var waterbrush : Bool=false;
	var holding :Int=-1;	
	var bookstate :Int=0; //0 default,1 crossed-out, 2 rewritten, 3 blank
	var bookfootprints :Bool=false;
	var statuesad :Bool=false;
	var cleanedbrush :Bool=false;

	function ResetAll(){
		haskey=false;
		unlocked=false;
		pedastalbook=true;
		pedastalbrush=false;
		floorbook=false;
		floorbrush=true;
		holding=-1;
		bookstate=0;
		bookfootprints=false;
		statuesad=false;
	}
	var tilemap:Array<Int> = [
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,0,0,0, 0,0,0, 0,0,0,0,
		0,1,1,1, 1,1,1, 1,1,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,1, 0,0,0, 1,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,1,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,0,0, 0,0,0, 0,0,1,0,
		0,1,1,1, 1,2,1, 1,1,1,0,
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

	var doorx=5;
	var doory=11;


	var keyx =7;
	var keyy =14;

	var px:Int=cellw*(7-1);//5
	var py:Int=cellh*(15);//20

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
		trace("AAA");
		cellwmid=Convert.toint(cellw/2);
		cellhmid=Convert.toint(cellh/2);
		Gfx.resizescreen(308,228);	
		Gfx.loadimage("bgtiles");
		Gfx.loadimage("book_cover");		
		Gfx.loadimage("book_covermask");
		Gfx.loadimage("book_blank_l");
		Gfx.loadimage("book_blank_r");		
		Gfx.loadimage("book_default_l");
		Gfx.loadimage("book_default_r");
		Gfx.loadimage("book_rewritten_l");
		Gfx.loadimage("book_rewritten_r");
		Gfx.loadimage("book_scored_l");
		Gfx.loadimage("book_scored_r");
		Gfx.loadimage("book_blank_l_stepped");
		Gfx.loadimage("book_blank_r_stepped");		
		Gfx.loadimage("book_default_l_stepped");
		Gfx.loadimage("book_default_r_stepped");
		Gfx.loadimage("book_rewritten_l_stepped");
		Gfx.loadimage("book_rewritten_r_stepped");
		Gfx.loadimage("book_scored_l_stepped");
		Gfx.loadimage("book_scored_r_stepped");
		Gfx.loadimage("bookanim_0");		
		Gfx.loadimage("bookanim_1");		
		Gfx.loadimage("bookanim_2");		
		Gfx.loadimage("bookanim_3");		
		Gfx.loadimage("bookanim_4");		
		Gfx.loadimage("bookanim_5");		
		Gfx.loadimage("bookanim_6");		
		Gfx.loadimage("bookanim_7");		
		Gfx.loadimage("bookanim_8");		
		Gfx.loadimage("bookanim_9");		
		Gfx.loadimage("bookframe");
		Gfx.loadimage("brush");
		Gfx.loadimage("fg_0");
		Gfx.loadimage("fg_1");
		Gfx.loadimage("fg_2");
		Gfx.loadimage("firepit");
		Gfx.loadimage("firepit2");
		Gfx.loadimage("firepit_fg");
		Gfx.loadimage("firepit2_fg");
		Gfx.loadimage("icon_drop");
		Gfx.loadimage("icon_exit");		
		Gfx.loadimage("icon_paint");
		Gfx.loadimage("icon_read");
		Gfx.loadimage("icon_steps");		
		Gfx.loadimage("icon_take");	
		Gfx.loadimage("icon_unlock");	
		Gfx.loadimage("key");
		Gfx.loadimage("player");
		Gfx.loadimage("playerwalk1");
		Gfx.loadimage("playerwalk2");
		Gfx.loadimage("smallbook");
		trace("BBB");
		Gfx.loadimage("waterpit");
		Gfx.loadimage("waterpit2");	
		Gfx.loadimage("waterpit_fg");
		Gfx.loadimage("waterpit2_fg");	
		Gfx.loadimage("burn/player_burn_0");	
		Gfx.loadimage("burn/player_burn_1");	
		Gfx.loadimage("burn/player_burn_2");	
		Gfx.loadimage("burn/player_burn_3");	
		Gfx.loadimage("burn/player_burn_4");	
		Gfx.loadimage("burn/player_burn_5");	
		Gfx.loadimage("burn/player_burn_6");	
		Gfx.loadimage("burn/player_burn_7");	
		Gfx.loadimage("burn/player_burn_8");	
		Gfx.loadimage("burn/player_burn_9");	
		Gfx.loadimage("burn/player_burn_10");	
		Gfx.loadimage("burn/player_burn_11");	
		Gfx.loadimage("burn/player_burn_12");	
		Gfx.loadimage("burn/player_burn_13");	
		Gfx.loadimage("burn/player_burn_14");	
		Gfx.loadimage("burn/player_burn_15");	
		Gfx.loadimage("burn/player_burn_16");	
		Gfx.loadimage("bookburn/book_burn_0");
		Gfx.loadimage("bookburn/book_burn_1");
		Gfx.loadimage("bookburn/book_burn_2");
		Gfx.loadimage("bookburn/book_burn_3");
		Gfx.loadimage("bookburn/book_burn_4");
		Gfx.loadimage("bookburn/book_burn_5");
		Gfx.loadimage("bookburn/book_burn_6");
		Gfx.loadimage("bookburn/book_burn_7");
		Gfx.loadimage("bookburn/book_burn_8");
		trace("CCC");			
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
	  	if (
	  			tx<0 ||
	  			tx>=gridw ||
	  			ty<0 ||
	  			ty>=gridh|| 
	  			tilemap[tx+gridw*ty]==1 ||
	  			(!unlocked&&tilemap[tx+gridw*ty]==2 ) ||
	  			((floorbook||floorbrush) && tx==brushx && ty == brushy) ||
	  			( !haskey && tx==keyx && ty==keyy)
	  		) {  		
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
  	var leftpage = "book_default_l";
  	var rightpage = "book_default_r";
  	if (bookstate==1){
  		leftpage="book_scored_l";  		
  		rightpage="book_scored_r"; 
  	} else if (bookstate==2){
  		leftpage="book_rewritten_l";  		
  		rightpage="book_rewritten_r"; 
  	} else if (bookstate==3){  		
  		leftpage="book_blank_l";  		
  		rightpage="book_blank_r"; 
  	}

  	if (bookfootprints){
  		leftpage+="_stepped";
  		rightpage+="_stepped";
  	}
  	var f2:Float=Convert.tofloat(f)/bookwmid;
  	if (f2>1){  		
  		var f3 = f2-1;
  		if (f3>1){
  			f3=1;
  		}  		
  		trace(f3);
  		var lpagew=Gfx.imagewidth(leftpage);
  		var lpagewmid=Convert.toint(lpagew/2);

  		var bookoffset2 = f3*lpagewmid;
  		
  		Gfx.scale(f3,1);
  	  	Gfx.drawimage(Gfx.CENTER-bookoffset2+1,Gfx.CENTER,leftpage);
  	  	Gfx.scale(1,1);

	  	Gfx.drawimage(Gfx.CENTER+bookoffset-1,Gfx.CENTER,rightpage);

  	} else {
	  	Gfx.drawimage(Gfx.CENTER+bookoffset-1,Gfx.CENTER,rightpage);

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

  var waterpitx :Int=3;
  var waterpity :Int=4;
  
  var firepitx :Int=7;
  var firepity :Int=4;

  var pedastalx :Int=5;
  var pedastaly :Int=7;
  
  var brushx :Int=8;
  var brushy :Int=8;

	var exitx=5;
	var exity=22;

  var t:Int=0;

  var cutscene :Int=-1;
  var cutscenetimer :Int=0;
	function StartReadBook(){
		if (!showbook){
			showbook=true;
			bookframe=0;
			initbookpause=5;
			trace("StartReadBook");
		}
	}
	function StartWaterpitSacrifice(){
		trace("StartWaterpitSacrifice");
		cutscene=0;
		cutscenetimer=0;
		dy=-1;
		py-=dy;
	}
	function StartFirepitSacrifice(){
		trace("StartFirepitSacrifice");
		cutscene=1;
		cutscenetimer=0;
		dy=-1;
		py-=dy;
	}

	var bookanimtimer=0;
	function DropItemInWaterpit(){
		if (holding==0){
			holding=-1;
			if (bookstate!=0){
				bookanimtimer=9;
			}
			bookstate=0;
			waterbook=true;
		}
		if (holding==1){
			holding=-1;
			waterbrush=true;
			cleanedbrush=true;
		}
		trace("DropItemInWaterpit");
	}
	function DropItemInFirepit(){
		trace("DropItemInFirepit");
		if (holding==0){
		} else if (holding==1){

		}
		holding=-1;
	}

	function StartWriteBook(){
		statuesad=true;
		if (bookstate==0){
			bookstate=1;
		} else if (bookstate==1){
			bookstate=2;
		} else if (bookstate==3){
			bookstate=0;
		}
		trace("StartWriteBook");
	}
	function StartStepOnBook(){
		trace("StartStepOnBook");
	}

  function ProcessAction(){
  	var tx=Convert.toint(px/cellw);
  	var ty=Convert.toint(py/cellh);
  	if (tx==waterpitx+1 && ty ==waterpity+0){
  		if (holding>=0&&!waterbook&&!waterbrush){
  			DropItemInWaterpit();
  		}
  	}
  	if (tx==waterpitx+0 && ty ==waterpity+1){
		StartWaterpitSacrifice();
  	}
  	if (tx==waterpitx+0 && ty ==waterpity-1){
  		if (waterbook){
  			holding=0;
  			waterbook=false;
  		}  	
  		if (waterbrush){
  			holding=1;
  			waterbrush=false;
  		}
  	}
  	if (tx==firepitx-1 && ty ==firepity+0){
  		if (holding>=0){
  			DropItemInFirepit();
  		}
  	}
  	if (tx==firepitx-0 && ty ==firepity+1){
		StartFirepitSacrifice();
  	}
  	if (tx==pedastalx-1 && ty ==pedastaly+0){
  		if (holding==-1){
  			if (pedastalbook){
  				holding=0;
  				pedastalbook=false;
  			} 
  			if (pedastalbrush){
  				holding=1;
  				statuesad=true;
  				pedastalbrush=false;
  			}
  		}
  	}
  	if (tx==pedastalx+0 && ty ==pedastaly+1){
  		if (pedastalbook){
  			StartReadBook();
  		}
  	}
  	if ( (bookstate%2==0 && tx==pedastalx+1 && ty ==pedastaly+0)
  		|| (bookstate%2==1 && tx==pedastalx-1 && ty ==pedastaly+0) ){
  		if (pedastalbook&&holding==1 && bookstate!=2){
  			StartWriteBook();
  		}
  	}

  	if (tx==pedastalx-0 && ty ==pedastaly-1){
  		if (holding>=0 && !pedastalbook &&!pedastalbrush){
  			if (holding==0){
  				pedastalbook=true;
  				holding=-1;
  			} 
  			if (holding==1){
  				pedastalbrush=true;
  				holding=-1;
  			}
  		}
  	}

  	if (tx==brushx-0 && ty ==brushy+0){
  		if (floorbook && !bookfootprints){
  			StartStepOnBook();
  		}
  	}
  	if (tx==brushx+0 && ty ==brushy+1){
  		if (holding==-1){
	  		if (floorbook){
	  			holding=0;
	  			floorbook=false;
	  		}
	  		if (floorbrush){
	  			holding=1;
	  			floorbrush=false;
	  		}
	  	}
  	}
  	if (tx==brushx-0 && ty ==brushy-1){
  		if (holding>=0 && !floorbook &&!floorbrush){
  			if (holding==0){
  				floorbook=true;
  				holding=-1;
  			} 
  			if (holding==1){
  				floorbrush=true;
  				holding=-1;
  			}
  		}
  	}
  	if (tx==keyx+0 && ty==keyy+1){
  		if (!haskey){
  			haskey=true;
  		}
  	}
  	if (tx==doorx+0 && ty==doory+1){
  		if (haskey){
  			unlocked=true;
  		}
  		trace("unlock door");
  	}
  }

  function update() {  	
  	t++;
  	var tx=Convert.toint(px/cellw);
  	var ty=Convert.toint(py/cellh);
  	var oldtx=tx;
  	var oldty=ty;
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
  		if (cutscene==-1){
	  		ProcessAction();
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
		} else if (cutscene==0){
			if (cutscenetimer==0){
				dy=-1;
				py-=dy;
				cutscenetimer++;
			} else if (cutscenetimer==1){
				cutscene=-1;
			}
		}  else if (cutscene==1){
			if (cutscenetimer==0){
				dy=-1;
				py-=dy;
				cutscenetimer++;
			} else if (cutscenetimer>0){
				
			}
		} 	  	
  	}  
  	if (dx!=0&&dy!=0){
  		cutscene=-1;
  		dx=0;
  		dy=0;
  		tx=oldtx;
  		ty=oldty;
  	}
  	if (dx!=0||dy!=0){  		
  		showbook=false;
  	}
 	px+=2*dx;
  	py+=2*dy;

  	var offy:Int=Gfx.screenheightmid-cellhmid-py;
  	var maxoffy=maph-screenh;
  	if (-offy>maxoffy){
  		offy=-maxoffy;
  	}
//  	Gfx.drawimage(0,offy,"bgtiles");
	if (!unlocked){
  		Gfx.drawimage(0,offy,"fg_0");
	} else if (statuesad){
  		Gfx.drawimage(0,offy,"fg_2");
  	} else {
  		Gfx.drawimage(0,offy,"fg_1");  		
  	}

  	if (!haskey){
  		Gfx.drawimage((keyx)*cellw,(keyy)*cellh+offy,"key");
  		Gfx.drawimage((keyx)*cellw,(keyy+1)*cellh+offy,"icon_take");
  	}

  	if (haskey&&!unlocked){
  		Gfx.drawimage((doorx)*cellw,(doory+1)*cellh+offy,"icon_unlock");  		
  	}
  	if (holding>=0){  		
  		if (!waterbook&&!waterbrush){
  			Gfx.drawimage((waterpitx+1)*cellw,(waterpity)*cellh+offy,"icon_drop");
  		}
  		Gfx.drawimage((firepitx-1)*cellw,(firepity)*cellh+offy,"icon_drop");
  	}
  	if (waterbrush||waterbook){
  		  Gfx.drawimage((waterpitx)*cellw,(waterpity-1)*cellh+offy,"icon_take");
  	}
 

  	if (holding==-1){
  		Gfx.drawimage((pedastalx-1)*cellw,(pedastaly)*cellh+offy,"icon_take");
  	}

  	if (holding==1 && pedastalbook && bookstate!=2){  	
  		if(bookstate%2==0){	
  			Gfx.drawimage((pedastalx+1)*cellw,(pedastaly)*cellh+offy,"icon_paint");
  		} else {
  			Gfx.drawimage((pedastalx-1)*cellw,(pedastaly)*cellh+offy,"icon_paint");
  		}
  	}

  	if (pedastalbook){
  		Gfx.drawimage((pedastalx)*cellw,(pedastaly+1)*cellh+offy,"icon_read");
  	}

	Gfx.drawimage((waterpitx)*cellw,(waterpity+1)*cellh+offy,"icon_steps");
	Gfx.drawimage((firepitx)*cellw,(firepity+1)*cellh+offy,"icon_steps");

  	if (floorbook&&!bookfootprints){
  		Gfx.drawimage((brushx-1)*cellw,(brushy)*cellh+offy,"icon_steps");
  	}

  	if ((floorbrush||floorbook)&&holding==-1){
  		Gfx.drawimage((brushx)*cellw,(brushy+1)*cellh+offy,"icon_take");
  	}

  	if (holding>=0 && !floorbrush && !floorbook){
  		Gfx.drawimage((brushx)*cellw,(brushy-1)*cellh+offy,"icon_drop");
  	}
  	if (holding>=0 && !pedastalbrush && !pedastalbook){
  		Gfx.drawimage((pedastalx)*cellw,(pedastaly-1)*cellh+offy,"icon_drop");
  	}
  		
  	Gfx.drawimage((exitx)*cellw,(exity)*cellh+offy,"icon_exit");

  	if ((t/10)%2<1){
  		Gfx.drawimage(85,77+offy,"waterpit");
  		Gfx.drawimage(141+2*28,71+offy,"firepit");
  	} else {
  		Gfx.drawimage(85,77+offy,"waterpit2");  		
  		Gfx.drawimage(141+2*28,71+offy,"firepit2");
  	}
  	if (frame==0){
  		if (cutscene==1&&cutscenetimer>0){
  			Gfx.drawimage(px+poffsetx,py+poffsety+offy,"burn/player_burn_"+(cutscenetimer+1));
  			if (cutscenetimer<17){
  				cutscenetimer++;
  			}
  		} else {
  			Gfx.drawimage(px+poffsetx,py+poffsety+offy,"player");
  		}
  	} else {
  		Gfx.drawimage(px+poffsetx,py+poffsety+offy,"playerwalk"+frame);
  	}
  		if (holding==0){
  			Gfx.drawimage(px+6+poffsetx,py+10+poffsety+offy,"smallbook");
  		} 
		if (holding==1){
			Gfx.drawimage(px+9+poffsetx,py+1+poffsety+offy,"brush");
		}

  	if (pedastalbook){
		Gfx.drawimage(122+28,106+19+offy,"smallbook");
	}
	if (pedastalbrush){		
  		Gfx.drawimage(124+28*1,106+10+offy,"brush");
	}
	if (floorbook){
  		Gfx.drawimage(177+28*2,138+1*19+offy,"smallbook");		
	}
	if (floorbrush){		
  		Gfx.drawimage(179+28*2,134+1*19+offy,"brush");
	}
  	if (waterbook){
		if (bookanimtimer<=9){
			Gfx.drawimage(122-1*28,107+7-19*2+offy,"bookanim_"+bookanimtimer);
			bookanimtimer++;		
		} else {
				Gfx.drawimage(122-1*28,107+7-19*2+offy,"smallbook");
		}
  	}
	if (waterbrush){
  		Gfx.drawimage(123-28,106+19-19*3+4+offy,"brush");
  	}


  	if (Convert.toint(py/cellh)==4){

	  	if ((t/10)%2<1){
  			Gfx.drawimage(85,77+offy,"waterpit_fg");
	  		Gfx.drawimage(141+2*28,71+offy,"firepit_fg");
	  	} else {
	  		Gfx.drawimage(85,77+offy,"waterpit2_fg");
	  		Gfx.drawimage(141+2*28,71+offy,"firepit2_fg");
	  	}
  	}

  if (showbook){
  	DrawBook();
  }
  if (showtext.length>0){
  	DrawTextBox();
  }
  }

}