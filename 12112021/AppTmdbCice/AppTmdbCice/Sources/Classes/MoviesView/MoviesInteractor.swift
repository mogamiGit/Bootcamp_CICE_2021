//
//  MoviesInteractor.swift
//  AppTmdbCice
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/11/21.
//

import Foundation

// Input
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataNowPlayingInteractor()
    func fetchDataPopularInteractor()
}

// Output
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInfoNowPlaying(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
    func setInfoPopular(completionData: Result<[ResultNowPlaying]?, NetworkingError>)
}

final class MoviesInteractor: BaseInteractor {
    
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
}

// extension Input
extension MoviesInteractor: MoviesInteractorInputProtocol {
    
    func fetchDataNowPlayingInteractor() {
        self.provider?.fetchDataNowPlayingProvider()
    }
    
    func fetchDataPopularInteractor() {
        self.provider?.fetchDataPopularProvider()
    }
    
}

// extension Output
extension MoviesInteractor: MoviesProviderOutputProtocol {
    func setInfoNowPlaying(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInfoPopular(completionData: Result<[ResultNowPlaying]?, NetworkingError>) {
        switch completionData{
        case .success(let data):
            self.viewModel?.setInfoPopularViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
