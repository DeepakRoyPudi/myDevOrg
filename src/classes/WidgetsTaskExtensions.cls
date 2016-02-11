Public class WidgetsTaskExtensions{
   private ApexPages.StandardController w;

    public WidgetsTaskExtensions(ApexPages.StandardController WTExtensions){
        w = WTExtensions;
        }
        
    Public pageReference toCancel(){
       w.cancel();
        return ApexPages.currentPage();
    }
    public Void toNext(){
    
    }
}