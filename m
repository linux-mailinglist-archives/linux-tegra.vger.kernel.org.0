Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B740A1A8DC7
	for <lists+linux-tegra@lfdr.de>; Tue, 14 Apr 2020 23:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731695AbgDNVen (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 14 Apr 2020 17:34:43 -0400
Received: from sonic312-21.consmr.mail.bf2.yahoo.com ([74.6.128.83]:44779 "EHLO
        sonic312-21.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731685AbgDNVeh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Apr 2020 17:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1586900074; bh=ezgCjMYbO9H891e0/rXAVe+rkkZTnZmKIDbdYN0e/ek=; h=Date:From:Reply-To:Subject:References:From:Subject; b=M+YmylyQMZuuq/lKZxYqW3qteGQ/zZwemSbAenBnP8dRGOKItYThESix/M0A34KeINRkPoOdrpumD0hB8hZYmry4e5jAsJtZq6XUNRBPscjPeMjOil2j9HC/LYCIRRhiWeP7ECfDcypLBOXz3efGgGM9FdryYoLFLfWL3OGMUq94P0EwKWkLjnBmpMDXnJTVc8qU6vxzDhZhtv8WSVH8NwGKUHWlU0dbHwTPedTMeB5yPCIeGQ8JIMxTpWWuOHCo/jbg6VgZOnOUL87t+gd40bG9ZnTIlRqmVAXbpLuvKnhNevRDyuawMwzp0oIQ9tYSzy8ofm9OJGg9lvg00qB4NQ==
X-YMail-OSG: 4B7rbdUVM1lriX85MKGjw4xaadMlU4LOnrWM8fuFVSAH0R_B5Psuge.kMCuVEhc
 Mpg78a4_B55VQzCyGnQWpnmEFgW_fo2hdhHyawAxzlA.u7b3xicSDWunL0f5hEQhArv4ZS8xOMr0
 mPFH1Xfdt8RnMXjoS_w5uC_FIliTQi.DWd9rVz_p_TJ5X5c8Fz7oAJGJ7106pjRHWGxiXFQpKbqa
 _5lcM3OmRkZggD1iKXkv0jGdfFi2xohaEGvZrbvJjp7jBCeYf811MRQJQo8aBF3tqm6GL4XTmogL
 lUMoahV.mbCM5vBDXLFzwxXmYkfjYeEd7MRjr7gmAFz3gxmu5M15p_iYxVt9yr8NSah2qoQg5yBF
 SylLeCo0GxWjlsXvfttP3.iI5hqivnXsVCG7B0l9vVF0QtDKaeNJ6VFyxdR_6IwDqbnTCp4KrBju
 N0aEO7rbBP8kpnaStw5FF65Gm8VzvY_DSck4lDsAJ.E2aELCVM5ej6HDR2KndP6GosBYVolwImI.
 t9cWyNrh8NatE4..HyBRPfcFTkxi4bnRy0fLC7keD8VWRHLIYpfOHW01brRauRy.8o6vf78_FZNP
 6a8G7PsObGfUMHFIm.uCfO4L.gdL0HU9wvmdmUGErTM1jlG5t4AdpmjGrcdsEXJylgy2kX009jnI
 5.CdGXiLVV27Omu.lpXursvOFuClx7_khHnCJAmOlAuleuv.GHR_u0GIaPAdnfSl3Mj_QliV56SA
 FLCsfOOo9u75mcV72aGFuWwoPmsQt6yLN5s1obtvvVFkrnx06KWVkD7tLKPUEA3fsSbvnqqwcRhe
 gl1XjYOu7thqRo7eQ.DRrX.wM8zNq7H0XXwLeaBD98PJnye4GJ2_J7_0w6ko5mx7suuppSg0rTcK
 jNANHYhV4i8GLcEfmLsrIIdHyPPfUztEVfQ728BuK_b2iFaT_bgkFbzS1tY8MnDS_Eh6Catdm52Q
 .E9ahp2SE5ybfbXHNsVsbwbQiD_xiAfbVEE5F.6zim0w0Y0.AuaViw0L.sxsDXeprjsXlztmjajw
 5.eMG3N3Euz2ZSlgTjIPW14KVJ4WOrpVAf4AemDC4dDmcOf2hfAS6tVHz6eKtYzUdMAbtWc.69ta
 seX1tlH5SFomU7RSHTLGetMCscIvDJuYB53F4DYhmR7pRyA.9xtH8S7OxMqlmh0qVqgwCDuCKzjT
 Wdn.II5t7zaxXJzoTRoSHtLNFpERM.EgBh4eV0U.nyforpxFko7aTVif7CG.N9tDApvgCQ.WIQgD
 .eyOB37WKemLO.GUUabupKF6RcVF6kl970myuk0ts5OiV5ADJQZPnIcaiENHoauEJPBULiJMb7zH
 BT5AHvaztG3wS8z93KP.dfYGqm6TsaR_nDGe89kE-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Tue, 14 Apr 2020 21:34:34 +0000
Date:   Tue, 14 Apr 2020 21:34:33 +0000 (UTC)
From:   " Patrick .V. Sawadogo" <patricawadogo@gmail.com>
Reply-To: patrick.sawadogo23@gmail.com
Message-ID: <531632973.384088.1586900073314@mail.yahoo.com>
Subject: Remain Blessed,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <531632973.384088.1586900073314.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15651 YMailNodin Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.94 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Dear=C2=A0Friend,

My=C2=A0name=C2=A0is=C2=A0Mr.=C2=A0Patrick=C2=A0Sawadogo.=C2=A0I=C2=A0am=C2=
=A0working=C2=A0with=C2=A0one=C2=A0of=C2=A0the=C2=A0prime=C2=A0banks=C2=A0i=
n=C2=A0Burkina=C2=A0Faso.=C2=A0Here=C2=A0in=C2=A0this=C2=A0bank=C2=A0existe=
d=C2=A0a=C2=A0dormant=C2=A0account=C2=A0for=C2=A0many=C2=A0years,=C2=A0whic=
h=C2=A0belong=C2=A0to=C2=A0one=C2=A0of=C2=A0our=C2=A0late=C2=A0foreign=C2=
=A0customers.=C2=A0The=C2=A0amount=C2=A0in=C2=A0this=C2=A0account=C2=A0valu=
es=C2=A0at=C2=A0(=E2=82=AC=C2=A04.3=C2=A0Million=C2=A0Euro)=C2=A0Four=C2=A0=
Million,
Three=C2=A0Hundred=C2=A0Thousand=C2=A0Euros,

I=C2=A0do=C2=A0not=C2=A0want=C2=A0this=C2=A0fund=C2=A0to=C2=A0be=C2=A0confi=
scated=C2=A0by=C2=A0the=C2=A0bank.=C2=A0This=C2=A0is=C2=A0the=C2=A0reason=
=C2=A0why=C2=A0I=C2=A0am=C2=A0contacting=C2=A0you.=C2=A0I=C2=A0seek=C2=A0yo=
ur=C2=A0consent=C2=A0to=C2=A0partner=C2=A0with=C2=A0you=C2=A0in=C2=A0this=
=C2=A0business=C2=A0transaction.
I=C2=A0want=C2=A0a=C2=A0foreign=C2=A0account=C2=A0where=C2=A0the=C2=A0bank=
=C2=A0will=C2=A0transfer=C2=A0this=C2=A0fund.=C2=A0This=C2=A0is=C2=A0a=C2=
=A0genuine,=C2=A0risk=C2=A0free=C2=A0and=C2=A0legal=C2=A0business=C2=A0tran=
saction.=C2=A0All=C2=A0details
shall=C2=A0be=C2=A0sent=C2=A0to=C2=A0you=C2=A0once=C2=A0you=C2=A0indicate=
=C2=A0your=C2=A0interest.

If=C2=A0you=C2=A0are=C2=A0really=C2=A0sure=C2=A0of=C2=A0your=C2=A0sincerity=
,=C2=A0trustworthiness,=C2=A0accountability=C2=A0and=C2=A0confidentiality=
=C2=A0over=C2=A0this=C2=A0transaction,=C2=A0reply=C2=A0back=C2=A0to=C2=A0me=
=C2=A0urgently=C2=A0through=C2=A0my=C2=A0private=C2=A0email=C2=A0address:=
=C2=A0patrick.sawadogo23@gmail.com

Best=C2=A0regards,
Remain=C2=A0Blessed,
Mr.=C2=A0Patrick=C2=A0.V.=C2=A0Sawadogo
