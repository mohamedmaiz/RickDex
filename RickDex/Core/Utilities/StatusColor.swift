import SwiftUI

func getStatusColor(_ status: String) -> Color {
    switch status {
    case "Alive" :
        return  AppColor.statusAlive
    case "Dead" :
        return AppColor.statusDead
    default :
         return .orange
        
    }
}
