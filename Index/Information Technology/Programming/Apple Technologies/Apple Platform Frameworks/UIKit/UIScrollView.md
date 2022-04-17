- [Как работает UIScrollView. О том, как работает UIScrollView, как… | by Ilya Lobanov | Medium](https://medium.com/@esskeetit/%D0%BA%D0%B0%D0%BA-%D1%80%D0%B0%D0%B1%D0%BE%D1%82%D0%B0%D0%B5%D1%82-uiscrollview-2e7052032d97)

## General

> It's more easy to layout elements in scrollview if they're in another view and this view in scrollView

![[UIScrollView/Screen_Shot_2020-08-30_at_21.22.20.png]]

`restorationIdentifier` - a thing to save some scroll view properties after application reload

We need to set `contentSize` for scroll view by ourselfs

To zoom we need to implement `viewForZoomingInScrollView` method

`contentInset` - its a margins from `scrollView` to it's inner view

![[UIScrollView/scrollView.contentInset__VIdgeIn.png]]

![[UIScrollView/_1_cW_-_I_1_.png]]

![[UIScrollView/scrollView._bounces__true.png]]

## Delegates

`willBeginDecelerating` - when user starts a fast scrolling

`didEndDecelerating`- scroll view did end fast scrolling initiated by user

`willEndDragging`- when users releases finger after starting scroll

> Depending of how fast your start scrolling, difference between e.g. `targetContentOffset.pointee.y` and `scrollView.contentOffset.y` will be more then 0. If you’ll scroll just a little bit then `targetContentOffset.pointee.y  == scrollView.contentOffset.y`