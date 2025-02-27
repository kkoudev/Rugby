//
//  CacheError.swift
//  Rugby
//
//  Created by Vyacheslav Khorkov on 31.01.2021.
//  Copyright © 2021 Vyacheslav Khorkov. All rights reserved.
//

import Foundation
import Rainbow

enum CacheError: Error, LocalizedError {
    case cantFindPodsTargets
    case cantFindXcodeCommandLineTools
    case buildFailed([String])

    var errorDescription: String? {
        let output: String
        switch self {
        case .cantFindPodsTargets:
            output = "Couldn't find pods targets.\n".red
                + "🚑 Try to call pod install.".yellow
        case .cantFindXcodeCommandLineTools:
            output = "Couldn't find Xcode CLT.\n".red
                + "🚑 Check Xcode Preferences → Locations → Command Line Tools.".yellow
        case .buildFailed(let errors):
            let buildCommand = "cat \(String.buildLog)"
            output = "Build failed.\n".red
                + errors.joined(separator: "\n").white + "\n"
                + "🚑 Get full log: ".yellow + buildCommand.white
        }
        return output
    }
}
