#if canImport(UIKit)

import UIKit

public extension UITableView {
    
    /// Registers a class for use in creating new table view cells.
    ///
    /// The method registers a cell of the given type using its reuse identifier.
    /// This property is a String value describing `self` as in the example below:
    ///
    ///     class SomeCell: UITableViewCell {}
    ///     SomeCell.reuseIdentifier // "SomeCell"
    ///
    /// That is, the original method is:
    ///
    ///     tableView.register(
    ///         SomeCell.self,
    ///         forCellReuseIdentifier: SomeCell.reuseIdentifier
    ///     )
    ///
    /// While the short method is:
    ///
    ///     tableView.register(cellClass: SomeCell.self)
    ///
    /// - Parameter cellClass: The class of a cell that you want to use in the collection view.
    ///
    func register<T: UITableViewCell>(cellClass: T.Type) -> Void {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Dequeues a reusable cell object located by its identifier.
    ///
    /// Call this method from your data source object when asked to provide a new cell for the table view.
    /// This method dequeues an existing cell if one is available or creates a new one based on the class or nib file you previously registered.
    ///
    /// The original method is:
    ///
    ///     let cell = tableView.dequeueReusableCell(
    ///         withReuseIdentifier: SomeCell.reuseIdentifier,
    ///         for: indexPath
    ///     ) as! SomeCell
    ///
    /// While the short method is:
    ///
    ///     let cell: SomeCell = tableView.dequeueReusableCell(for: indexPath)
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
    /// - Returns: A valid `UITableViewCell` object.
    ///
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
}

#endif
