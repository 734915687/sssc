$(function(){
    $(".focusBox").slide({
        titCell:".hd",
        mainCell:".pic",
        effect:"leftLoop",/*left leftLoop top topLoop fold fade*/
        autoPlay:true,
        autoPage:true,
        delayTime:600,
        interTime:3000,
        trigger:"click"
    });
})