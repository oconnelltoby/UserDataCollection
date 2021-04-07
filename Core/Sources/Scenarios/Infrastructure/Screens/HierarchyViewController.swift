//
// Copyright © 2021 Toby O'Connell. All rights reserved.
//

import UIKit

extension HierarchyViewController {
    private enum Section {
        case main
    }

    public class Item: Hashable {
        public enum Part {
            case leaf(action: () -> Void)
            case node(items: [Item])
        }

        private let id = UUID()
        var title: String
        var part: Part

        public init(title: String, part: Part) {
            self.title = title
            self.part = part
        }

        public static func == (lhs: HierarchyViewController.Item, rhs: HierarchyViewController.Item) -> Bool {
            lhs.id == rhs.id
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
}

extension HierarchyViewController {
    private static func makeLayout() -> UICollectionViewLayout {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .sidebarPlain)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

    private static func makeCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collectionView.backgroundColor = .systemGroupedBackground
        return collectionView
    }

    private static func makeNodeCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        .init { cell, _, menuItem in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = menuItem.title
            configuration.textProperties.font = .preferredFont(forTextStyle: .headline)
            cell.contentConfiguration = configuration

            let disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options: disclosureOptions)]
            cell.backgroundConfiguration = UIBackgroundConfiguration.clear()
        }
    }

    private static func makeLeafCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        .init { cell, _, menuItem in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = menuItem.title
            cell.contentConfiguration = configuration
        }
    }

    private static func makeDataSource(collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<Section, Item> {
        let nodeCellConguration = makeNodeCellRegistration()
        let leafCellConguration = makeLeafCellRegistration()

        return .init(collectionView: collectionView) { collectionView, indexPath, item in
            switch item.part {
            case .leaf:
                return collectionView.dequeueConfiguredReusableCell(using: leafCellConguration, for: indexPath, item: item)
            case .node:
                return collectionView.dequeueConfiguredReusableCell(using: nodeCellConguration, for: indexPath, item: item)
            }
        }
    }

    private static func apply(items: [Item], to dataSource: UICollectionViewDiffableDataSource<Section, Item>) {
        var snapshot = NSDiffableDataSourceSectionSnapshot<Item>()

        func addItems(items: [Item], to parent: Item? = nil) {
            snapshot.append(items, to: parent)

            for item in items {
                if case let .node(items) = item.part {
                    addItems(items: items, to: item)
                }
            }
        }

        addItems(items: items)
        dataSource.apply(snapshot, to: .main, animatingDifferences: false)
    }
}

extension HierarchyViewController {
    private class Delegate: NSObject, UICollectionViewDelegate {
        private var getItem: (IndexPath) -> Item?

        init(getItem: @escaping (IndexPath) -> Item?) {
            self.getItem = getItem
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            guard let item = getItem(indexPath) else { return }
            collectionView.deselectItem(at: indexPath, animated: false)

            if case let .leaf(action) = item.part {
                action()
            }
        }
    }
}

public class HierarchyViewController: UIViewController {
    private let dataSource: UICollectionViewDiffableDataSource<Section, Item>
    private let delegate: Delegate

    public init(items: [Item]) {
        let collectionView = Self.makeCollectionView()
        let dataSource = Self.makeDataSource(collectionView: collectionView)
        Self.apply(items: items, to: dataSource)

        delegate = Delegate(
            getItem: { indexPath in
                dataSource.itemIdentifier(for: indexPath)
            }
        )

        collectionView.delegate = delegate
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)

        view = collectionView
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
