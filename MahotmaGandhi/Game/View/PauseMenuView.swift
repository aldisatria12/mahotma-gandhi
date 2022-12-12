//
//  PauseMenuView.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 31/08/22.
//

import SwiftUI

struct PauseMenuView: View {
    @Binding var closePauseMenu: Bool
    @Binding var showingPlayerView: Bool
    var body: some View {
        ZStack {
            BlurView(style: .regular)
                .ignoresSafeArea()
                .background(.black)
                .opacity(0.8)
            ZStack {
                Image("Pause_Menu")
                    .resizable()
                    .frame(width: 272 / 390 * UIScreen.main.bounds.width, height: 310 / 844 * UIScreen.main.bounds.height, alignment: .center)
                VStack {
                    Spacer()
                    Button(action: {
                        closePauseMenu = false
                    }, label: {
                        Text("Resume")
                            .font(.system(size: 22, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(blue01)
                            .background(yellow02
                                .cornerRadius(25)
                                .frame(width: 200 / 390 * UIScreen.main.bounds.width, height: 50 / 844 * UIScreen.main.bounds.height, alignment: .center))
                    })
                    .frame(width: 200 / 390 * UIScreen.main.bounds.width, height: 50 / 844 * UIScreen.main.bounds.height, alignment: .center)
                    .padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Button(action: {
                        showingPlayerView = true
                    }, label: {
                        Text("Manage Party")
                            .font(.system(size: 22, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(blue01)
                            .background(yellow02
                                .cornerRadius(25)
                                .frame(width: 200 / 390 * UIScreen.main.bounds.width, height: 50 / 844 * UIScreen.main.bounds.height, alignment: .center))
                    })
                    .frame(width: 200 / 390 * UIScreen.main.bounds.width, height: 50 / 844 * UIScreen.main.bounds.height, alignment: .center)
                    .padding(.init(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Button(action: {
                        NavigationUtil.popToRootView()
                    }, label: {
                        Text("Main Menu")
                            .font(.system(size: 22, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(blue01)
                            .background(yellow02
                                .cornerRadius(25)
                                .frame(width: 200 / 390 * UIScreen.main.bounds.width, height: 50 / 844 * UIScreen.main.bounds.height, alignment: .center))
                    })
                    .frame(width: 200 / 390 * UIScreen.main.bounds.width, height: 50 / 844 * UIScreen.main.bounds.height, alignment: .center)
                    .padding(.init(top: 0, leading: 0, bottom: 35, trailing: 0))
                }
            }
            .frame(width: 272 / 390 * UIScreen.main.bounds.width, height: 310 / 844 * UIScreen.main.bounds.height)
        }
    }
}

struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
    
}

//struct PauseMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        PauseMenuView()
//    }
//}
