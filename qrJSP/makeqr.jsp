<%@ page language="java" contentType="image/png; charset=UTF-8" %><%@ page
  import="java.util.*"
  import="java.awt.*"
  import="java.io.*"
  import="java.util.*"
  import="javax.imageio.ImageIO"
  import="java.awt.image.BufferedImage"
  import="com.google.zxing.BarcodeFormat"
  import="com.google.zxing.EncodeHintType"
  import="com.google.zxing.WriterException"
  import="com.google.zxing.common.BitMatrix"
  import="com.google.zxing.qrcode.QRCodeWriter"
  import="com.google.zxing.qrcode.decoder.ErrorCorrectionLevel"
%><%!
//
private static void createQRImage(OutputStream qrFile, String qrCodeText, int size, String fileType)
            throws WriterException, IOException {
        // Create the ByteMatrix for the QR-Code that encodes the given String
        Hashtable<EncodeHintType, ErrorCorrectionLevel> hintMap = new Hashtable();
        hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix byteMatrix = qrCodeWriter.encode(qrCodeText, BarcodeFormat.QR_CODE, size, size, hintMap);

        // Make the BufferedImage that are to hold the QRCode
        int matrixWidth = byteMatrix.getWidth();
        BufferedImage image = new BufferedImage(matrixWidth, matrixWidth, BufferedImage.TYPE_INT_RGB);
        image.createGraphics();

        Graphics2D graphics = (Graphics2D) image.getGraphics();
        graphics.setColor(Color.white);
        graphics.fillRect(0, 0, matrixWidth, matrixWidth);
        // Paint and save the image using the ByteMatrix
        graphics.setColor(Color.blue);

        for (int i = 0; i < matrixWidth; i++) {
            for (int j = 0; j < matrixWidth; j++) {
                if (byteMatrix.get(i, j)) {
                    graphics.fillRect(i, j, 1, 1);
                }
            }
        }

        ImageIO.write(image, fileType, qrFile);
    }

%><%
java.io.OutputStream outstream = response.getOutputStream();

//out.print(request.getParameter("host"));
//out.print("?q=");
//out.print(request.getParameter("code"));
createQRImage(outstream,request.getParameter("host"),125,"png");
outstream.flush();

%>

