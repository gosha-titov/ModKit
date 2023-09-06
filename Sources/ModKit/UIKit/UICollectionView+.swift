#if canImport(UIKit)

import UIKit

public extension UICollectionView {
    
    /// Scrolls to top by setting the content offset to zero.
    /// - Parameter animated: Specify `true` to animate scroll transition, or `false` if you do not want the scroll transition to be animated.
    /// The default value is `true`.
    func scrollToTop(animated: Bool = true) -> Void {
        setContentOffset(.zero, animated: animated)
    }
    
    /// Scrolls to bottom by setting the content offset to the bottom point.
    /// - Parameter animated: Specify `true` to animate scroll transition, or `false` if you do not want the scroll transition to be animated.
    /// The default value is `true`.
    func scrollToBottom(animated: Bool = true) -> Void {
        let yOffset: CGFloat = contentSize.height - bounds.size.height
        guard yOffset > 0 else { return }
        let offset = CGPoint(x: 0, y: yOffset)
        setContentOffset(offset, animated: animated)
    }
    
    /// Registers a class for use in creating new collection view cells.
    ///
    /// The method registers a cell of the given type using its reuse identifier.
    /// This property is a String value describing `self` as in the example below:
    ///
    ///     class SomeCell: UICollectionViewCell {}
    ///     SomeCell.reuseIdentifier // "SomeCell"
    ///
    /// That is, the original method is:
    ///
    ///     collectionView.register(
    ///         SomeCell.self,
    ///         forCellWithReuseIdentifier: SomeCell.reuseIdentifier
    ///     )
    ///
    /// While the short method is:
    ///
    ///     collectionView.register(cellClass: SomeCell.self)
    ///
    /// - Parameter cellClass: The class of a cell that you want to use in the collection view.
    ///
    func register<T: UICollectionViewCell>(cellClass: T.Type) -> Void {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Registers a class for use in creating a collection view header.
    ///
    /// The method registers a header of the given type using its reuse identifier.
    /// This property is a String value describing `self` as in the example below:
    ///
    ///     class SomeHeader: UICollectionReusableView {}
    ///     SomeHeader.reuseIdentifier // "SomeHeader"
    ///
    /// That is, the original method is:
    ///
    ///     collectionView.register(
    ///         SomeHeader.self,
    ///         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
    ///         withReuseIdentifier: SomeHeader.reuseIdentifier
    ///     )
    ///
    /// While the short method is:
    ///
    ///     collectionView.register(headerClass: SomeHeader.self)
    ///
    /// - Parameter headerClass: The class of a header that you want to use in the collection view.
    ///
    func register<T: UICollectionReusableView>(headerClass: T.Type) -> Void {
        register(
            T.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.reuseIdentifier
        )
    }
    
    /// Registers a class for use in creating a collection view footer.
    ///
    /// The method registers a footer of the given type using its reuse identifier.
    /// This property is a String value describing `self` as in the example below:
    ///
    ///     class SomeFooter: UICollectionReusableView {}
    ///     SomeFooter.reuseIdentifier // "SomeFooter"
    ///
    /// That is, the original method is:
    ///
    ///     collectionView.register(
    ///         SomeFooter.self,
    ///         forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
    ///         withReuseIdentifier: SomeFooter.reuseIdentifier
    ///     )
    ///
    /// While the short method is:
    ///
    ///     collectionView.register(footerClass: SomeFooter.self)
    ///
    /// - Parameter footerClass: The class of a footer that you want to use in the collection view.
    ///
    func register<T: UICollectionReusableView>(footerClass: T.Type) -> Void {
        register(
            T.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.reuseIdentifier
        )
    }
    
    /// Dequeues a reusable cell object located by its identifier.
    ///
    /// Call this method from your data source object when asked to provide a new cell for the collection view.
    /// This method dequeues an existing cell if one is available or creates a new one based on the class or nib file you previously registered.
    ///
    /// The original method is:
    ///
    ///     let cell = collectionView.dequeueReusableCell(
    ///         withReuseIdentifier: SomeCell.reuseIdentifier,
    ///         for: indexPath
    ///     ) as! SomeCell
    ///
    /// While the short method is:
    ///
    ///     let cell: SomeCell = collectionView.dequeueReusableCell(for: indexPath)
    ///
    /// - Important: You must register a class using the `register(cellClass:)` method before calling this method.
    ///
    /// This method initializes the cell by calling its `init(frame:)` method.
    /// If an existing cell was available for reuse, this method calls the cell’s `prepareForReuse()` method instead.
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// The data source receives this information when it is asked for the cell and should just pass it along.
    /// This method uses the index path to perform additional configuration based on the cell’s position in the collection view.
    ///
    /// - Returns: A valid `UICollectionReusableView` object.
    ///
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
}

#endif
