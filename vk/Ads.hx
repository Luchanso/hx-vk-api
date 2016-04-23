package;
import flash.events.Event;
import openfl.display.Loader;
import openfl.display.Sprite;

enum PositionType {
	HORIZONTAL;
	VERTICAL;
}

/**
 * ...
 * @author Loutchansky Oleg
 */
class Ads
{
	public static function create(id : String, x : Float, y : Float, width : Int, height : Int, flashVars : Dynamic, count : Int = 4, isTest : Bool = true, typePosition : PositionType = PositionType.HORIZONTAL)
	{	
		var mainVKBanner = new com.vk.MainVKBanner(id);
		
		var params = new com.vk.vo.BannersPanelVO(); // создание класса параметров баннера
		// изменение стандартных параметров:
		if (isTest) 
		{
			params.demo = '1'; // показывает тестовые баннеры
		} 
		else 
		{
			params.demo = '0'; 
		}
		
		// вертикальный (AD_TYPE_VERTICAL) или горизонтальный (AD_TYPE_HORIZONTAL) блок баннеров
		
		if (typePosition == PositionType.HORIZONTAL) 
		{
			params.ad_type = com.vk.vo.BannersPanelVO.AD_TYPE_HORIZONTAL;
			params.ad_unit_type = com.vk.vo.BannersPanelVO.AD_UNIT_TYPE_HORIZONTAL;
		} 
		else 
		{
			params.ad_type = com.vk.vo.BannersPanelVO.AD_TYPE_VERTICAL;
			params.ad_unit_type = com.vk.vo.BannersPanelVO.AD_UNIT_TYPE_VERTICAL;
		}
		
		params.ad_height = height;
		params.ad_width = width;
		
		params.ads_count = count;
		
		mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_COMPLETE, banner_onLoad);
		mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_IS_EMPTY, banner_onAdsEmpty);
		mainVKBanner.addEventListener(com.vk.MainVKBannerEvent.LOAD_ERROR, banner_onError);
		
		mainVKBanner.initBanner(flashVars, params);

		mainVKBanner.x = x;
		mainVKBanner.y = y;
		
		return mainVKBanner;
	}
	
}