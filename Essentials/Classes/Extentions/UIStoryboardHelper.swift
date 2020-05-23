//
//  StoryboardHelper.swift
//  Kunal Gupta
//
//  Created by Kunal Gupta on 02/01/20.
//  Copyright © 2020 Kunal Gupta Financial Corp. All rights reserved.
//

import Foundation

protocol StoryboardIdentifier {
    static var identifier: String {get}
}

extension StoryboardIdentifier where Self: UIViewController  {
    static var identifier: String {
        return String(describing: self)
    }
}

extension StoryboardIdentifier where Self: UITableViewCell  {
    static var identifier: String {
        return String(describing: self)
    }
}

extension StoryboardIdentifier where Self: UICollectionViewCell  {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardIdentifier{}
extension UITableViewCell: StoryboardIdentifier{}
extension UICollectionViewCell: StoryboardIdentifier {}

extension UIStoryboard {
    
    enum Storyboard: String {
        case main
        case login
        case introduction
        case dashboard
        case activities
        case transfer
        case account
        case support
        case integration
        case transferwise
        case xero
        case linkAccount
        case depositCheck

        var name: String {
            return rawValue.upperCaseFirst() //capitalizing first character only
        }
    }
    
    //MARK: - Convenience Initializers
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.name, bundle: bundle)
    }
    
    internal func instantiate<T: UIViewController>() -> T {
        guard let vc = instantiateViewController(withIdentifier: T.identifier) as? T else {
            fatalError("Can not find storyboard identifier \(T.identifier)")
        }
        return vc
    }
}

extension UITableView {
    
    internal func dequeueReusableCell <T: UITableViewCell>(_ indexpath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexpath) as? T else {
            fatalError("Could not found storybord identifier \(T.identifier)")
        }
        return cell
    }
    
    internal func registerNib(_ T: UITableViewCell.Type ){
      register(UINib.init(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
}

extension UICollectionView {
    
    internal func dequeueReusableCell <T: UICollectionViewCell>(_ indexpath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexpath) as? T else {
            fatalError("Could not found storybord identifier \(T.identifier)")
        }
        return cell
    }
    
    internal func registerNib(_ T: UICollectionViewCell.Type ){
        register(UINib.init(nibName: T.identifier, bundle: nil), forCellWithReuseIdentifier: T.identifier)
    }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType>(segue: S, sender: AnyObject? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

struct StoryboardSegue {
  enum Account: String, StoryboardSegueType {
    case accountLogout = "accountLogout"
    case changePassword = "changePassword"
    case confirmPassword = "confirmPassword"
  }
  enum Dashboard: String, StoryboardSegueType {
    case dashboardVC = "dashboardVC"
  }
  enum Main: String, StoryboardSegueType {
    case tabbarVC = "tabbarVC"
  }
}


