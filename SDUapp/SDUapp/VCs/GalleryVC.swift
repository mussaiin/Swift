//
//  GalleryVC.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 06.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController, UIScrollViewDelegate{
    var contentWidth: CGFloat = 0.0
    
    let campusImages = [UIImage(named: "campus1"), UIImage(named: "campus2"), UIImage(named: "campus3"), UIImage(named: "campus4"), UIImage(named: "campus5"), UIImage(named: "campus6"), UIImage(named: "campus7")]
    
    let studLifeImages = [UIImage(named: "students1"), UIImage(named: "students2"), UIImage(named: "students3"), UIImage(named: "students4"), UIImage(named: "students5"), UIImage(named: "students6"), UIImage(named: "students7")]
    
    @IBOutlet weak var studLifeScrollView: UIScrollView!
    @IBOutlet weak var studLifePageControl: UIPageControl!
    
    @IBOutlet weak var campusScrollView: UIScrollView!
    @IBOutlet weak var campusPageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollViewWidth:CGFloat = campusScrollView.frame.width
        let scrollViewHeight:CGFloat = campusScrollView.frame.height
        
        self.studLifeScrollView.frame = CGRect(x:0, y:0, width: scrollViewWidth, height: scrollViewHeight)
        
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "campus1")
        imgOne.contentMode = UIViewContentMode.scaleAspectFill
        
        print(self.studLifeScrollView.frame.width)
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "campus2")
        imgTwo.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "campus3")
        imgThree.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgFour.image = UIImage(named: "campus4")
        imgFour.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgFive = UIImageView(frame: CGRect(x:scrollViewWidth*4, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgFive.image = UIImage(named: "campus5")
        imgFive.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgSix = UIImageView(frame: CGRect(x:scrollViewWidth*5, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgSix.image = UIImage(named: "campus6")
        imgSix.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgSeven = UIImageView(frame: CGRect(x:scrollViewWidth*6, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgSeven.image = UIImage(named: "campus7")
        imgSeven.contentMode = UIViewContentMode.scaleAspectFill
        
        self.studLifeScrollView.addSubview(imgOne)
        self.studLifeScrollView.addSubview(imgTwo)
        self.studLifeScrollView.addSubview(imgThree)
        self.studLifeScrollView.addSubview(imgFour)
        self.studLifeScrollView.addSubview(imgFive)
        self.studLifeScrollView.addSubview(imgSix)
        self.studLifeScrollView.addSubview(imgSeven)
        
        self.studLifeScrollView.contentSize = CGSize(width:scrollViewWidth * 7, height:scrollViewHeight)
        self.studLifeScrollView.delegate = self
        self.studLifePageControl.currentPage = 0
        
        ////////////////////////////////////////////////////////////////////
        
        self.campusScrollView.frame = CGRect(x:0, y:0, width: campusScrollView.frame.width, height: campusScrollView.frame.height)
        
        let imgOne1 = UIImageView(frame: CGRect(x:0, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgOne1.image = UIImage(named: "students1")
        imgOne1.contentMode = UIViewContentMode.scaleAspectFill
        print(self.campusScrollView.frame.width)
        let imgTwo2 = UIImageView(frame: CGRect(x:scrollViewWidth, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgTwo2.image = UIImage(named: "students2")
        imgTwo2.contentMode = UIViewContentMode.scaleAspectFill
        let imgThree3 = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgThree3.image = UIImage(named: "students3")
        imgThree3.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgFour4 = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgFour4.image = UIImage(named: "students4")
        imgFour4.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgFive5 = UIImageView(frame: CGRect(x:scrollViewWidth*4, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgFive5.image = UIImage(named: "students5")
        imgFive5.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgSix6 = UIImageView(frame: CGRect(x:scrollViewWidth*5, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgSix6.image = UIImage(named: "students6")
        imgSix6.contentMode = UIViewContentMode.scaleAspectFill
        
        let imgSeven7 = UIImageView(frame: CGRect(x:scrollViewWidth*6, y:0, width: scrollViewWidth, height:scrollViewHeight))
        imgSeven7.image = UIImage(named: "students7")
        imgSeven7.contentMode = UIViewContentMode.scaleAspectFill
        
        self.campusScrollView.addSubview(imgOne1)
        self.campusScrollView.addSubview(imgTwo2)
        self.campusScrollView.addSubview(imgThree3)
        self.campusScrollView.addSubview(imgFour4)
        self.campusScrollView.addSubview(imgFive5)
        self.campusScrollView.addSubview(imgSix6)
        self.campusScrollView.addSubview(imgSeven7)
        
        self.campusScrollView.contentSize = CGSize(width:scrollViewWidth * 7, height:scrollViewHeight)
        self.campusScrollView.delegate = self
        self.campusPageControl.currentPage = 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = studLifeScrollView.frame.width
        let currentPage:CGFloat = floor((studLifeScrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.studLifePageControl.currentPage = Int(currentPage);
        
        let pageWidth1:CGFloat = campusPageControl.frame.width
        let currentPage1:CGFloat = floor((campusScrollView.contentOffset.x-pageWidth1/2)/pageWidth1)+1
        // Change the indicator
        self.campusPageControl.currentPage = Int(currentPage1);
        // Change the text accordingly
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
