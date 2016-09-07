// ==UserScript==
// @name         dentaku_1to100
// @namespace    dentaku_1to100
// @version      0.1
// @description  dentaku_1to100
// @author       poco
// @match        https://www.google.co.jp/*
// @grant        none
// ==/UserScript==

//---------------------------------------
// startボタンとタイマーを追加用
// ロード後に実行してほしいので２秒後に実行
//---------------------------------------
setTimeout(function () {
    var div = document.getElementById("trev");
    var adddiv = document.createElement('div');
    adddiv.innerHTML = '<button>start</button><span id="result"></span>';
    adddiv.addEventListener("click",calc);
    div.appendChild(adddiv);
},2000);

//---------------------------------------
// main
//---------------------------------------
function calc()
{
  //--- 入力用
  var num = [];
  num[0] = document.getElementById("cwbt43");
  num[1] = document.getElementById("cwbt33");
  num[2] = document.getElementById("cwbt34");
  num[3] = document.getElementById("cwbt35");
  num[4] = document.getElementById("cwbt23");
  num[5] = document.getElementById("cwbt24");
  num[6] = document.getElementById("cwbt25");
  num[7] = document.getElementById("cwbt13");
  num[8] = document.getElementById("cwbt14");
  num[9] = document.getElementById("cwbt15");
  var tasu = document.getElementById("cwbt46");
  var eq = document.getElementById("cwbt45");
  
  //--- 入力用のイベントを作成
  var event = document.createEvent( "MouseEvents" );
  event.initMouseEvent("mouseup", false, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
  
  //--- 実行ボタンをいれた配列を作成
  var arr = [];
  for(var i=1;i<1000;i++){       //--- 1～100の場合は <100 にしてください
    var a = Math.floor(i/100);
    var b = Math.floor((i-a*100)/10);
    var c = i%10;
    if( a > 0){
      arr[arr.length] = num[a];
      arr[arr.length] = num[b];
    }else if(b>0){
      arr[arr.length] = num[b];
    }
    arr[arr.length] = num[c];
    if( i%10 === 0){
      arr[arr.length] = eq;
    }
    arr[arr.length] = tasu;
  }
  arr[arr.length] = num[1];
  arr[arr.length] = num[0];
  arr[arr.length] = num[0];
  arr[arr.length] = num[0];    //--- 1～100の場合はコメントアウトしてください
  arr[arr.length] = eq;
  
  var i=0;
  var len = arr.length;

  //------- 実行開始 --------
  var start = Date.now();
  for (; i <len ; i=(i+1)|0 ){
    arr[i].dispatchEvent(event);
  }
  var end = Date.now();
  //------- ここまで --------

  //--- 結果を出力
  var result = document.getElementById("result");
  result.innerHTML = "time:"+((end-start)/1000)+"秒";
  
  //--- 再走用に初期化
  setTimeout(function () {
    result.innerHTML = "";
    num[0].dispatchEvent(event);
    eq.dispatchEvent(event);
  },2000);
}
