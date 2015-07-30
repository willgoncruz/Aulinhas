//
// Autogenerated by Natalie - Storyboard Generator Script.
// http://blog.krzyzanowskim.com
//

import UIKit

//MARK: - Storyboards
struct Storyboards {

    struct Main {

        static let identifier = "Main"

        static var storyboard: UIStoryboard {
            return UIStoryboard(name: self.identifier, bundle: nil)
        }

        static func instantiateInitialViewController() -> CustomNavigationController! {
            return self.storyboard.instantiateInitialViewController() as! CustomNavigationController
        }

        static func instantiateViewControllerWithIdentifier(identifier: String) -> UIViewController {
            return self.storyboard.instantiateViewControllerWithIdentifier(identifier) as! UIViewController
        }
    }
}

//MARK: - ReusableKind
enum ReusableKind: String, Printable {
    case TableViewCell = "tableViewCell"
    case CollectionViewCell = "collectionViewCell"

    var description: String { return self.rawValue }
}

//MARK: - SegueKind
enum SegueKind: String, Printable {    
    case Relationship = "relationship" 
    case Show = "show"                 
    case Presentation = "presentation" 
    case Embed = "embed"               
    case Unwind = "unwind"             

    var description: String { return self.rawValue } 
}

//MARK: - SegueProtocol
public protocol IdentifiableProtocol: Equatable {
    var identifier: String? { get }
}

public protocol SegueProtocol: IdentifiableProtocol {
}

public func ==<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
   return lhs.identifier == rhs.identifier
}

public func ~=<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
   return lhs.identifier == rhs.identifier
}

public func ==<T: SegueProtocol>(lhs: T, rhs: String) -> Bool {
   return lhs.identifier == rhs
}

public func ~=<T: SegueProtocol>(lhs: T, rhs: String) -> Bool {
   return lhs.identifier == rhs
}

//MARK: - ReusableViewProtocol
public protocol ReusableViewProtocol: IdentifiableProtocol {
    var viewType: UIView.Type? {get}
}

public func ==<T: ReusableViewProtocol, U: ReusableViewProtocol>(lhs: T, rhs: U) -> Bool {
   return lhs.identifier == rhs.identifier
}

//MARK: - Protocol Implementation
extension UIStoryboardSegue: SegueProtocol {
}

extension UICollectionReusableView: ReusableViewProtocol {
    public var viewType: UIView.Type? { return self.dynamicType}
    public var identifier: String? { return self.reuseIdentifier}
}

extension UITableViewCell: ReusableViewProtocol {
    public var viewType: UIView.Type? { return self.dynamicType}
    public var identifier: String? { return self.reuseIdentifier}
}

//MARK: - UIViewController extension
extension UIViewController {
    func performSegue<T: SegueProtocol>(segue: T, sender: AnyObject?) {
       performSegueWithIdentifier(segue.identifier, sender: sender)
    }

    func performSegue<T: SegueProtocol>(segue: T) {
       performSegue(segue, sender: nil)
    }
}

//MARK: - UICollectionView

extension UICollectionView {

    func dequeueReusableCell<T: ReusableViewProtocol>(reusable: T, forIndexPath: NSIndexPath!) -> UICollectionViewCell? {
        if let identifier = reusable.identifier {
            return dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: forIndexPath) as? UICollectionViewCell
        }
        return nil
    }

    func registerReusableCell<T: ReusableViewProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            registerClass(type, forCellWithReuseIdentifier: identifier)
        }
    }

    func dequeueReusableSupplementaryViewOfKind<T: ReusableViewProtocol>(elementKind: String, withReusable reusable: T, forIndexPath: NSIndexPath!) -> UICollectionReusableView? {
        if let identifier = reusable.identifier {
            return dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier, forIndexPath: forIndexPath) as? UICollectionReusableView
        }
        return nil
    }

    func registerReusable<T: ReusableViewProtocol>(reusable: T, forSupplementaryViewOfKind elementKind: String) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            registerClass(type, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        }
    }
}
//MARK: - UITableView

extension UITableView {

    func dequeueReusableCell<T: ReusableViewProtocol>(reusable: T, forIndexPath: NSIndexPath!) -> UITableViewCell? {
        if let identifier = reusable.identifier {
            return dequeueReusableCellWithIdentifier(identifier, forIndexPath: forIndexPath) as? UITableViewCell
        }
        return nil
    }

    func registerReusableCell<T: ReusableViewProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            registerClass(type, forCellReuseIdentifier: identifier)
        }
    }

    func dequeueReusableHeaderFooter<T: ReusableViewProtocol>(reusable: T) -> UITableViewHeaderFooterView? {
        if let identifier = reusable.identifier {
            return dequeueReusableHeaderFooterViewWithIdentifier(identifier) as? UITableViewHeaderFooterView
        }
        return nil
    }

    func registerReusableHeaderFooter<T: ReusableViewProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
             registerClass(type, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}


//MARK: - CustomNavigationController

//MARK: - SeasonListViewController
extension UIStoryboardSegue {
    func selection() -> SeasonListViewController.Segue? {
        if let identifier = self.identifier {
            return SeasonListViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension SeasonListViewController { 

    enum Segue: String, Printable, SegueProtocol {
        case season_to_episodes = "season_to_episodes"

        var kind: SegueKind? {
            switch (self) {
            case season_to_episodes:
                return SegueKind(rawValue: "show")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var destination: UIViewController.Type? {
            switch (self) {
            case season_to_episodes:
                return ListEpisodesViewController.self
            default:
                assertionFailure("Unknown destination")
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}
extension SeasonListViewController { 

    enum Reusable: String, Printable, ReusableViewProtocol {
        case Seasons = "Seasons"

        var kind: ReusableKind? {
            switch (self) {
            case Seasons:
                return ReusableKind(rawValue: "tableViewCell")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var viewType: UIView.Type? {
            switch (self) {
            case Seasons:
                return CurrentSeasonCell.self
            default:
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}


//MARK: - ShowViewController
extension UIStoryboardSegue {
    func selection() -> ShowViewController.Segue? {
        if let identifier = self.identifier {
            return ShowViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension ShowViewController { 

    enum Segue: String, Printable, SegueProtocol {
        case show_seasons = "show_seasons"

        var kind: SegueKind? {
            switch (self) {
            case show_seasons:
                return SegueKind(rawValue: "show")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var destination: UIViewController.Type? {
            switch (self) {
            case show_seasons:
                return SeasonListViewController.self
            default:
                assertionFailure("Unknown destination")
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}

//MARK: - ShowListViewController
extension UIStoryboardSegue {
    func selection() -> ShowListViewController.Segue? {
        if let identifier = self.identifier {
            return ShowListViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension ShowListViewController { 

    enum Segue: String, Printable, SegueProtocol {
        case show_scroll = "show_scroll"

        var kind: SegueKind? {
            switch (self) {
            case show_scroll:
                return SegueKind(rawValue: "show")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var destination: UIViewController.Type? {
            switch (self) {
            case show_scroll:
                return ShowScrollViewController.self
            default:
                assertionFailure("Unknown destination")
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}
extension ShowListViewController { 

    enum Reusable: String, Printable, ReusableViewProtocol {
        case Show = "Show"

        var kind: ReusableKind? {
            switch (self) {
            case Show:
                return ReusableKind(rawValue: "collectionViewCell")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var viewType: UIView.Type? {
            switch (self) {
            case Show:
                return ShowCell.self
            default:
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}


//MARK: - ShowScrollViewController
extension UIStoryboardSegue {
    func selection() -> ShowScrollViewController.Segue? {
        if let identifier = self.identifier {
            return ShowScrollViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension ShowScrollViewController { 

    enum Segue: String, Printable, SegueProtocol {
        case seasons_button = "seasons_button"

        var kind: SegueKind? {
            switch (self) {
            case seasons_button:
                return SegueKind(rawValue: "show")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var destination: UIViewController.Type? {
            switch (self) {
            case seasons_button:
                return SeasonListViewController.self
            default:
                assertionFailure("Unknown destination")
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}

//MARK: - EpisodeViewController

//MARK: - ListEpisodesViewController
extension UIStoryboardSegue {
    func selection() -> ListEpisodesViewController.Segue? {
        if let identifier = self.identifier {
            return ListEpisodesViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension ListEpisodesViewController { 

    enum Segue: String, Printable, SegueProtocol {
        case episodes_to_episode = "episodes_to_episode"

        var kind: SegueKind? {
            switch (self) {
            case episodes_to_episode:
                return SegueKind(rawValue: "show")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var destination: UIViewController.Type? {
            switch (self) {
            case episodes_to_episode:
                return EpisodeViewController.self
            default:
                assertionFailure("Unknown destination")
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}
extension ListEpisodesViewController { 

    enum Reusable: String, Printable, ReusableViewProtocol {
        case Episode = "Episode"

        var kind: ReusableKind? {
            switch (self) {
            case Episode:
                return ReusableKind(rawValue: "tableViewCell")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var viewType: UIView.Type? {
            switch (self) {
            case Episode:
                return episodeTableCell.self
            default:
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}


//MARK: - SeasonListScrollViewController
extension SeasonListScrollViewController { 

    enum Reusable: String, Printable, ReusableViewProtocol {
        case SeasonScroll = "SeasonScroll"

        var kind: ReusableKind? {
            switch (self) {
            case SeasonScroll:
                return ReusableKind(rawValue: "tableViewCell")
            default:
                preconditionFailure("Invalid value")
                break
            }
        }

        var viewType: UIView.Type? {
            switch (self) {
            case SeasonScroll:
                return SeasonCell.self
            default:
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}

