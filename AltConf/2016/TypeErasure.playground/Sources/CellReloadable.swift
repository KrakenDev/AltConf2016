import Foundation

public struct Transaction {}
protocol CellReloadable: class {
    associatedtype DataType
    var selectedIndexPath: NSIndexPath? { get set }
    var loadingCellObjects: [NSIndexPath : DataType] { get set }
    
    func didFinishEditing(updated: Bool, newObject: DataType)
}

class AnyCellReloadable<ErasedDataType>: CellReloadable {
    var selectedIndexPath: NSIndexPath?
    var loadingCellObjects: [NSIndexPath : ErasedDataType] {
        get { return _getLoadingCellObjects() }
        set { _setLoadingCellObjects(newValue) }
    }
    
    private let _didFinishEditing: (Bool, ErasedDataType) -> Void
    private let _getLoadingCellObjects: Void -> [NSIndexPath : ErasedDataType]
    private let _setLoadingCellObjects: [NSIndexPath : ErasedDataType] -> Void
    
    init<Injected: CellReloadable where Injected.DataType == ErasedDataType>(_ reloadable: Injected) {
        selectedIndexPath = reloadable.selectedIndexPath
        
        _didFinishEditing = reloadable.didFinishEditing
        _getLoadingCellObjects = { return reloadable.loadingCellObjects }
        _setLoadingCellObjects = { reloadable.loadingCellObjects = $0 }
    }
    
    func didFinishEditing(updated: Bool, newObject: ErasedDataType) {
        _didFinishEditing(updated, newObject)
    }
}