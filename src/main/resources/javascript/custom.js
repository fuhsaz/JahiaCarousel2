$(document).ready(function(){
  console.log("ready");
  $('.carouselMain').each(function(){
    var curID = $(this).attr('id');
    console.log("curID", curID);
    var settings = {};
  	var items;
    var singleItem;
    var autoPlay
    
    /* ===========   Number of items onscreen   ================= */
    /* Number of items at max display size */
    searchString = getSS(curID, 'Items');
    var itemsInput = $(searchString).text();
    if (!itemsInput.localeCompare('none')==0) {
    	items = parseInt(itemsInput);
       	settings.items = items;
    }
    /* Option to display only a single item */
    var tempSingle = $(getSS(curID, 'SingleItem')).text();
    if (!tempSingle.localeCompare('none')==0) {
    	if (tempSingle.localeCompare('true') == 0) {
     		singleItem = true;
    	} else {
     		singleItem = false;
    	}
      	settings.singleItem = singleItem;
    }
    
    /* ===========   Navigation Options   ================= */
    /* Autoplay */
    autoPlayTemp = $(getSS(curID, 'AutoPlay')).text();
    if (!autoPlayTemp.localeCompare('none') == 0) {
    	if (autoPlayTemp.localeCompare('false') == 0) {
     	  autoPlay = false;
        } else {
          var autoPlayTime = parseInt(autoPlayTemp);
          autoPlay = autoPlayTime;
        }
      	settings.autoPlay = autoPlay;
    }
    /* Enable/Disable Navigation Buttons */
    var tempNav = $(getSS(curID, 'Navigation')).text();
    if (!tempNav.localeCompare('none')==0) {
      if (tempNav.localeCompare('true') == 0) {
        navigation = true;
      } else {
        navigation = false;
      }
      settings.navigation = navigation;
    }
    
    /* Call the owlCarousel() method with the constructed settings object */
    $(this).owlCarousel(settings);
    
  });
    
  /* To generate the '.carouselID .carouselDesiredVariable' selector for jquery */
  function getSS(id, varName){
    var ss = ".";
    ss += id;
    ss += " .carousel";
    ss += varName;
    return ss;
  };
  
  /*
  $('carousel1').owlCarousel({
    autoPlay: 3000,
    singleItem: true
  });
  */
  
  
  
});