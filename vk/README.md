---

## Установка Ads Для OpenFL:

Для установки рекламы от VK, необходимо добавить файл Patch.patch в корень проекта

Также необходимо скопировать в корень папку lib

И добавить project.xml код:
```xml
<haxeflag name="-swf-lib-extern" value="lib/vk_ads.swc" />
<haxeflag name="--macro" value="patchTypes('Patch.patch')" />
```