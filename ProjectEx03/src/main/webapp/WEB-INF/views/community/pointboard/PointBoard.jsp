<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
</head>
</section>
<style>
h2{
   text-align: center;
}
img{
    margin: auto;
}
button{
   margin-left: 37.5%;
    margin-top: 6%;
    width: 26%;
}
</style>
<h2>출석 체크</h2>
<div class="roulette" style="display:none;">
  <img src="/resources/community/img/포인트.png"/>
  <img src="/resources/community/img/포인트.png"/>
  <img src="/resources/community/img/포인트.png"/>
  <img src="/resources/community/img/포인트.png"/>
  <img src="/resources/community/img/포인트.png"/>
</div>
<input type="hidden" id="0" value="100"/>
<input type="hidden" id="1" value="200"/>
<input type="hidden" id="2" value="300"/>
<input type="hidden" id="3" value="400"/> 
<input type="hidden" id="4" value="500"/>
<button class="btn btn-info" id="go">Go</button>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  <script>

(function($){var Roulette=function(options){var defaultSettings={maxPlayCount:null,speed:10,stopImageNumber:null,rollCount:3,duration:3,stopCallback:function(){},startCallback:function(){},slowDownCallback:function(){}};var defaultProperty={playCount:0,$rouletteTarget:null,imageCount:null,$images:null,originalStopImageNumber:null,totalHeight:null,topPosition:0,maxDistance:null,slowDownStartDistance:null,isRunUp:true,isSlowdown:false,isStop:false,distance:0,runUpDistance:null,isIE:navigator.userAgent.toLowerCase().indexOf("msie")>-1};var p=$.extend({},defaultSettings,options,defaultProperty);var reset=function(){p.maxDistance=defaultProperty.maxDistance;p.slowDownStartDistance=defaultProperty.slowDownStartDistance;p.distance=defaultProperty.distance;p.isRunUp=defaultProperty.isRunUp;p.isSlowdown=defaultProperty.isSlowdown;p.isStop=defaultProperty.isStop;p.topPosition=defaultProperty.topPosition};var slowDownSetup=function(){if(p.isSlowdown){return}p.slowDownCallback();p.isSlowdown=true;p.slowDownStartDistance=p.distance;p.maxDistance=p.distance+2*p.totalHeight;p.maxDistance+=p.imageHeight-p.topPosition%p.imageHeight;if(p.stopImageNumber!=null){p.maxDistance+=(p.totalHeight-p.maxDistance%p.totalHeight+p.stopImageNumber*p.imageHeight)%p.totalHeight}};var roll=function(){var speed_=p.speed;if(p.isRunUp){if(p.distance<=p.runUpDistance){var rate_=~~(p.distance/p.runUpDistance*p.speed);speed_=rate_+1}else{p.isRunUp=false}}else if(p.isSlowdown){var rate_=~~((p.maxDistance-p.distance)/(p.maxDistance-p.slowDownStartDistance)*p.speed);speed_=rate_+1}if(p.maxDistance&&p.distance>=p.maxDistance){p.isStop=true;reset();p.stopCallback(p.$rouletteTarget.find("img").eq(p.stopImageNumber));return}p.distance+=speed_;p.topPosition+=speed_;if(p.topPosition>=p.totalHeight){p.topPosition=p.topPosition-p.totalHeight}if(p.isIE){p.$rouletteTarget.css("top","-"+p.topPosition+"px")}else{p.$rouletteTarget.css("transform","translate(0px, -"+p.topPosition+"px)")}setTimeout(roll,1)};var init=function($roulette){$roulette.css({overflow:"hidden"});defaultProperty.originalStopImageNumber=p.stopImageNumber;if(!p.$images){p.$images=$roulette.find("img").remove();p.imageCount=p.$images.length;p.$images.eq(0).bind("load",function(){p.imageHeight=$(this).height();$roulette.css({height:p.imageHeight+"px"});p.totalHeight=p.imageCount*p.imageHeight;p.runUpDistance=2*p.imageHeight}).each(function(){if(this.complete||this.complete===undefined){var src=this.src;this.src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";this.src=src}})}$roulette.find("div").remove();p.$images.css({display:"block"});p.$rouletteTarget=$("<div>").css({position:"relative",top:"0"}).attr("class","roulette-inner");$roulette.append(p.$rouletteTarget);p.$rouletteTarget.append(p.$images);p.$rouletteTarget.append(p.$images.eq(0).clone());$roulette.show()};var start=function(){p.playCount++;if(p.maxPlayCount&&p.playCount>p.maxPlayCount){return}p.stopImageNumber=$.isNumeric(defaultProperty.originalStopImageNumber)&&Number(defaultProperty.originalStopImageNumber)>=0?Number(defaultProperty.originalStopImageNumber):Math.floor(Math.random()*p.imageCount);p.startCallback();roll();setTimeout(function(){slowDownSetup()},p.duration*1e3)};var stop=function(option){if(!p.isSlowdown){if(option){var stopImageNumber=Number(option.stopImageNumber);if(0<=stopImageNumber&&stopImageNumber<=p.imageCount-1){p.stopImageNumber=option.stopImageNumber}}slowDownSetup()}};var option=function(options){p=$.extend(p,options);p.speed=Number(p.speed);p.duration=Number(p.duration);p.duration=p.duration>1?p.duration-1:1;defaultProperty.originalStopImageNumber=options.stopImageNumber};var ret={start:start,stop:stop,init:init,option:option};return ret};var pluginName="roulette";$.fn[pluginName]=function(method,options){return this.each(function(){var self=$(this);var roulette=self.data("plugin_"+pluginName);if(roulette){if(roulette[method]){roulette[method](options)}else{console&&console.error("Method "+method+" does not exist on jQuery.roulette")}}else{roulette=new Roulette(method);roulette.init(self,method);$(this).data("plugin_"+pluginName,roulette)}})}})(jQuery);


var option = {
   speed : 10,
   duration : 3,
   stopImageNumber : 0
};

var count = $('div.roulette').children().length;

$('div.roulette').roulette(option);

var point = 0;

$().ready(function() {
   $('#go').click(function() { 
     option.stopImageNumber = (Math.random() * count) >> 0;
     $('div.roulette').roulette('option', option).roulette('start'); 
      
     point = $('#'+option.stopImageNumber).val();
   
      $.ajax({
          type:'post',
         url : '/community/pointboard/PointBoard',
         dataType : 'text',
         data : {
               user_point:point
         },
         success: function(result){
            
            StartClock();
         }
      });
   });
});

var count = 0;
function StartClock() {

    timerId = setTimeout(StartClock, 3800);
    
    if(count==1){
       alert(point+"point 획득");
      window.close();
   }
    count++;

}


</script>

</html>