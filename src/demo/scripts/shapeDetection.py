import numpy as np
import cv2
import numpy as np
import math
import numpy as np
import cv2

# def countShape(img):
#     gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
#     # gray = cv2.convertScaleAbs(img)
#
#     # cv2.imwrite("img.png",img)
#     # gray = cv2.imread("img.png", 0)
#     print type(img), np.shape(img[0])
#     print np.shape(gray)
#     ret,thresh = cv2.threshold(gray,127,255,1)
#     contours,h, jjj = cv2.findContours(thresh,1,2)
#
#     triangle = 0
#     circle = 0
#
#     for cnt in contours:
#         approx = cv2.approxPolyDP(cnt,0.01*cv2.arcLength(cnt,True),True)
#         print len(approx)
#         if len(approx)==5:
#             print "pentagon"
#             # cv2.drawContours(img,[cnt],0,255,-1)
#         elif len(approx)==3:
#             print "triangle"
#             triangle = triangle + 1
#             # cv2.drawContours(img,[cnt],0,(0,255,0),-1)
#         elif len(approx)==4:
#             print "square"
#             # cv2.drawContours(img,[cnt],0,(0,0,255),-1)
#         elif len(approx) == 9:
#             print "half-circle"
#             # cv2.drawContours(img,[cnt],0,(255,255,0),-1)
#         elif len(approx) > 15:
#             circle = circle + 1
#             print "circle"
#             # cv2.drawContours(img,[cnt],0,(0,255,255),-1)
#
#     return triangle, circle

def countShape(img):
    #dictionary of all contours
    contours = {}
    #array of edges of polygon
    approx = []
    #scale of the text
    scale = 2
    def angle(pt1,pt2,pt0):
        dx1 = pt1[0][0] - pt0[0][0]
        dy1 = pt1[0][1] - pt0[0][1]
        dx2 = pt2[0][0] - pt0[0][0]
        dy2 = pt2[0][1] - pt0[0][1]
        return float((dx1*dx2 + dy1*dy2))/math.sqrt(float((dx1*dx1 + dy1*dy1))*(dx2*dx2 + dy2*dy2) + 1e-10)


    #Capture frame-by-frame
    #ret, frame = cap.read()
    #print frame.shape, frame is a nparray, shape 480*640*3
    ret = True
    frame = img
    while True:
        if ret==True:
        #grayscale
           gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        #Canny
           canny = cv2.Canny(frame,80,240,3)

        #contours
        canny2, contours, hierarchy = cv2.findContours(canny,cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
        #print contours
        triangle = 0
        circle = 0

        for i in range(0,len(contours)):
            #approximate the contour with accuracy proportional to
            #the contour perimeter
            approx = cv2.approxPolyDP(contours[i],cv2.arcLength(contours[i],True)*0.02,True)

            #Skip small or non-convex objects
            if(abs(cv2.contourArea(contours[i]))<100 or not(cv2.isContourConvex(approx))):
                continue

            #triangle
            if(len(approx) == 3):
                # x,y,w,h = cv2.boundingRect(contours[i])
                triangle = triangle + 1
                print "tri"
                # cv2.putText(frame,'TRI',(x,y),cv2.FONT_HERSHEY_SIMPLEX,scale,(128,128,128),2,cv2.LINE_AA)
            # elif(len(approx)>=4 and len(approx)<=6):
            #     #nb vertices of a polygonal curve
            #     vtc = len(approx)
            #     #get cos of all corners
            #     cos = []
            #     for j in range(2,vtc+1):
            #         cos.append(angle(approx[j%vtc],approx[j-2],approx[j-1]))
            # #sort ascending cos
            #     cos.sort()
            # #get lowest and highest
            #     mincos = cos[0]
            #     maxcos = cos[-1]
            #
            # #Use the degrees obtained above and the number of vertices
            # #to determine the shape of the contour
            #     x,y,w,h = cv2.boundingRect(contours[i])
            #     if(vtc==4):
            #         print "rect"
            #         cv2.putText(frame,'RECT',(x,y),cv2.FONT_HERSHEY_SIMPLEX,scale,(128,128,128),2,cv2.LINE_AA)
            #     elif(vtc==5):
            #         print "penta"
            #         cv2.putText(frame,'PENTA',(x,y),cv2.FONT_HERSHEY_SIMPLEX,scale,(128,128,128),2,cv2.LINE_AA)
            #     elif(vtc==6):
            #         print "hexa"
            #         cv2.putText(frame,'HEXA',(x,y),cv2.FONT_HERSHEY_SIMPLEX,scale,(128,128,128),2,cv2.LINE_AA)
            else:
                #detect and label circle
                area = cv2.contourArea(contours[i])
                x,y,w,h = cv2.boundingRect(contours[i])
                radius = w/2
                if(abs(1 - (float(w)/h))<=2 and abs(1-(area/(math.pi*radius*radius)))<=0.2):
                    circle = circle + 1
                    #cv2.putText(frame,'CIRC',(x,y),cv2.FONT_HERSHEY_SIMPLEX,scale,(128,128,128),2,cv2.LINE_AA)

        return triangle, circle
