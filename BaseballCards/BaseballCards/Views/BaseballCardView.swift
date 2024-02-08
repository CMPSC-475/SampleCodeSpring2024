//
//  BaseballCardView.swift
//  BaseballCards
//
//  Created by Nader Alfares on 2/6/24.
//

import SwiftUI

struct BaseballCardView: View {
    @EnvironmentObject var manager : Manager
    @Binding var card : CardInfo
    @State var offset : CGSize = CGSize.zero
    @State var angle : Angle = Angle.zero
    
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { value in
                dragChanged(with: value)
            }
            .onEnded { value in
                dragEnded(with: value)
            }
        
        Image(manager.imageNameFor(card))
            .offset(offset)
            .rotationEffect(angle)
            .gesture(dragGesture)
            .animation(.linear, value: offset)
            .onChange(of: card.status) {
                if card.status == .unDecided {
                    offset = .zero
                    angle  = .zero
                }
            }
        
        
    }
    
    func dragChanged(with value: DragGesture.Value) {
        let angleChangeFactor : CGFloat = 0.2
        offset = value.translation
        angle = Angle(degrees: value.translation.width * angleChangeFactor)
    }
    
    func dragEnded(with value: DragGesture.Value) {
        let direction = SwipeDirection.afterMoving(x: offset.width)
        let newStatus = manager.newStateAfter(direction)
        
        card.updateStatus(newStatus)
        
        if direction == .none {
            angle = Angle.zero
        }
        
        offset = CGSize(width: newWidthOffsetAfter(direction), height: 0)
        
    }
    
    func newWidthOffsetAfter(_ d: SwipeDirection) -> CGFloat {
        let offscreen : CGFloat = 500
        switch d {
        case .left:
            return -offscreen
        case .right:
            return offscreen
        case .none:
            return 0
        }
    }
    
    
}

#Preview {
    BaseballCardView(card: .constant(CardInfo.standard))
        .environmentObject(Manager())
}
