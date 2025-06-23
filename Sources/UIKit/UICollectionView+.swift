#if canImport(UIKit)

import UIKit

public extension UICollectionView {
    
    /// Registers a class for use in creating new collection view cells.
    ///
    /// The method automatically registers a cell of the given type
    /// since the `UICollectionReusableView` class has the `reuseIdentifier` static property:
    ///
    ///     class SomeCell: UICollectionViewCell {}
    ///     SomeCell.reuseIdentifier // "SomeCell"
    ///
    /// This is a short simplified method of the original one:
    ///
    ///     // Modern method
    ///     collectionView.register(cellClass: SomeCell.self)
    ///
    ///     // Original method
    ///     collectionView.register(
    ///         SomeCell.self,
    ///         forCellWithReuseIdentifier: SomeCell.reuseIdentifier
    ///     )
    ///
    /// - Parameter cellClass: The class of a cell that you want to use in the collection view.
    @inlinable @inline(__always)
    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Registers a class for use in creating header views for the collection view.
    ///
    /// The method automatically registers a header view of the given type
    /// since the `UICollectionReusableView` class has the `reuseIdentifier` static property:
    ///
    ///     class SomeHeaderView: UICollectionReusableView {}
    ///     SomeHeaderView.reuseIdentifier // "SomeHeaderView"
    ///
    /// This is a short simplified method of the original one:
    ///
    ///     // Modern method
    ///     collectionView.register(headerClass: SomeHeaderView.self)
    ///
    ///     // Original method
    ///     collectionView.register(
    ///         SomeHeaderView.self,
    ///         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
    ///         withReuseIdentifier: SomeHeaderView.reuseIdentifier
    ///     )
    ///
    /// - Parameter headerClass: The class to use for the header view.
    @inlinable @inline(__always)
    func register<T: UICollectionReusableView>(headerClass: T.Type) {
        register(
            T.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.reuseIdentifier
        )
    }
    
    /// Registers a class for use in creating footer views for the collection view.
    ///
    /// The method automatically registers a footer view of the given type
    /// since the `UICollectionReusableView` class has the `reuseIdentifier` static property:
    ///
    ///     class SomeFooterView: UICollectionReusableView {}
    ///     SomeFooterView.reuseIdentifier // "SomeFooterView"
    ///
    /// This is a short simplified method of the original one:
    ///
    ///     // Modern method
    ///     collectionView.register(footerClass: SomeFooterView.self)
    ///
    ///     // Original method
    ///     collectionView.register(
    ///         SomeFooterView.self,
    ///         forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
    ///         withReuseIdentifier: SomeFooterView.reuseIdentifier
    ///     )
    ///
    /// - Parameter footerClass: The class to use for the footer view.
    @inlinable @inline(__always)
    func register<T: UICollectionReusableView>(footerClass: T.Type) {
        register(
            T.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.reuseIdentifier
        )
    }
    
    /// Dequeues a reusable cell object located by its reusable identifier.
    ///
    /// Call this method from your data source object when asked to provide a new cell for the collection view.
    /// This method dequeues an existing cell if one is available or creates a new one based on the class you previously registered.
    /// - Important: You must register a class using the `register(cellClass:)` method before calling this method.
    ///
    /// This is a short simplified method of the original one:
    ///
    ///     // Modern method
    ///     let cell: SomeCell = collectionView.dequeueReusableCell(
    ///         for: indexPath
    ///     )
    ///
    ///     // Original method
    ///     let cell = collectionView.dequeueReusableCell(
    ///         withReuseIdentifier: SomeCell.reuseIdentifier,
    ///         for: indexPath
    ///     ) as! SomeCell
    ///
    /// This method initializes the cell by calling its `init(frame:)` method.
    /// If an existing cell was available for reuse, this method calls the its `prepareForReuse()` method instead.
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// The data source receives this information when it is asked for the cell and should just pass it along.
    /// This method uses the index path to perform additional configuration based on the cell’s position in the collection view.
    ///
    /// - Returns: A valid `UICollectionReusableView` object.
    @inlinable @inline(__always)
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    /// Dequeues a reusable header view located by its reusable identifier and kind.
    ///
    /// Call this method from your data source object when asked to provide a new header view for the collection view.
    /// This method dequeues an existing view if one is available or creates a new one based on the class you previously registered.
    /// - Important: You must register a class using the `register(headerClass:)` method before calling this method.
    ///
    /// This is a short simplified method of the original one:
    ///
    ///     // Modern method
    ///     let headerView: SomeHeaderView = collectionView.dequeueReusableHeaderView(
    ///         for: indexPath
    ///     )
    ///
    ///     // Original method
    ///     let headerView = collectionView.dequeueReusableSupplementaryView(
    ///         ofKind: UICollectionView.elementKindSectionHeader,
    ///         withReuseIdentifier: SomeHeaderView.reuseIdentifier,
    ///         for: indexPath
    ///     ) as! SomeHeaderView
    ///
    /// This method initializes the header view by calling its `init(frame:)` method.
    /// If an existing header view was available for reuse, this method calls the its `prepareForReuse()` method instead.
    ///
    /// - Parameter indexPath: The index path specifying the location of the header view in the collection view.
    /// The data source receives this information when it’s asked for the view and should just pass it along.
    /// This method uses the information to perform additional configuration based on the view’s position in the collection view.
    ///
    /// - Returns: A valid `UICollectionReusableView` object.
    @inlinable @inline(__always)
    func dequeueReusableHeaderView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as! T
    }
    
    /// Dequeues a reusable footer view located by its reusable identifier and kind.
    ///
    /// Call this method from your data source object when asked to provide a new footer view for the collection view.
    /// This method dequeues an existing view if one is available or creates a new one based on the class you previously registered.
    /// - Important: You must register a class using the `register(footerClass:)` method before calling this method.
    ///
    /// This is a short simplified method of the original one:
    ///
    ///     // Modern method
    ///     let footerView: SomeFooterView = collectionView.dequeueReusableFooterView(
    ///         for: indexPath
    ///     )
    ///
    ///     // Original method
    ///     let footerView = collectionView.dequeueReusableSupplementaryView(
    ///         ofKind: UICollectionView.elementKindSectionFooter,
    ///         withReuseIdentifier: SomeFooterView.reuseIdentifier,
    ///         for: indexPath
    ///     ) as! SomeFooterView
    ///
    /// This method initializes the footer view by calling its `init(frame:)` method.
    /// If an existing footer view was available for reuse, this method calls the its `prepareForReuse()` method instead.
    ///
    /// - Parameter indexPath: The index path specifying the location of the footer view in the collection view.
    /// The data source receives this information when it’s asked for the view and should just pass it along.
    /// This method uses the information to perform additional configuration based on the view’s position in the collection view.
    ///
    /// - Returns: A valid `UICollectionReusableView` object.
    @inlinable @inline(__always)
    func dequeueReusableFooterView<T: UICollectionReusableView>(for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as! T
    }
    
}

#endif
