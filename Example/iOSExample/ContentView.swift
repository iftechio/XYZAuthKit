//
//  ContentView.swift
//  iOSExample
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()

    var body: some View {
        VStack {
            Text("XYZ Auth Example")
                .font(.system(size: 25, weight: .medium))
                .padding(24)

            switch vm.status {
            case .idle:
                EmptyView()
            case .authorizing:
                Text("authorizing...")
                ProgressView()
            case .authSuccess(let code):
                Text("auth success!")
                    .foregroundStyle(.blue)
                Text(code)
            case .authFailed(let error):
                Text("auth failed..")
                    .foregroundStyle(.red)
                Text(error.localizedDescription)
            }

            Spacer()
            if !vm.isRegistered {
                Button {
                    vm.registerApp()
                } label: {
                    Text("初始化 SDK")
                        .font(.system(size: 20, weight: .medium))
                }
                .frame(height: 44)
            }
            Button {
                vm.startAuthorize()
            } label: {
                Text("开始授权")
                    .font(.system(size: 20, weight: .medium))
            }
            .frame(height: 44)

            HStack(spacing: 12) {
                Button {
                    vm.checkXYZInstalled()
                } label: {
                    Text("检查是否安装")
                        .font(.system(size: 18))
                }
                if let isInstalled = vm.isXYZInstalled {
                    Text(isInstalled ? "Yes!" : "No..")
                }
            }
            .frame(height: 36)

            Text("sdk v\(vm.version)")
                .padding(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
