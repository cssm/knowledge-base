- *Smooth Scrolling of [UICollectionVIew](UICollectionVIew.md) and [UITableView](UITableView.md)*
	- if we build app with iOS 15 SDK there's a new system cell prefetching (not prefetchDelegate for data) that pefetches next cells automaticly and avoid hitches
	![Scrolling with cell prefetching](photo_2021-11-26%2013.31.43.jpeg)
	 - before iOS 15 appling snapshot without animation `==` `reloadData()`, now only applies the difference [NSDiffableDataSource](NSDiffableDataSource.md)