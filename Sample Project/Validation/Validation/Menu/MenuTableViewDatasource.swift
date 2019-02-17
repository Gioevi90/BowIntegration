import UIKit

class MenuTableViewDatasource: NSObject, UITableViewDataSource, UITableViewDelegate {
    weak var view: MenuViewProtocol?

    init(view: MenuViewProtocol) {
        self.view = view
    }

    let datasource: [(String, String)] = [(Constant.dataType.option, Constant.segueIdentifier.option),
                                          (Constant.dataType.either, Constant.segueIdentifier.either),
                                          (Constant.dataType.validated, Constant.segueIdentifier.validated)]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.cellIdentifier) as? MenuTableViewCell

        cell?.setTitle(datasource[indexPath.row].0)

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
        view?.presentSegue(datasource[indexPath.row].1)
    }
}
