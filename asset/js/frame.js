
    function reinitIframe(){
    
        var ifram = $(".frame-div");
    
        try{
            ifram.each(function(){
                var bHeight = this.contentWindow.document.body.scrollHeight;
                var dHeight = this.contentWindow.document.documentElement.scrollHeight;
                var height = Math.max(bHeight, dHeight);
                this.height = height;
    
            })
        }catch (ex){}
    }
    window.setInterval("reinitIframe()", 200);

