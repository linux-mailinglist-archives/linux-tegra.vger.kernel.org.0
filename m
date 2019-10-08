Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD72CF2BA
	for <lists+linux-tegra@lfdr.de>; Tue,  8 Oct 2019 08:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729935AbfJHGZn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 8 Oct 2019 02:25:43 -0400
Received: from mail-eopbgr10086.outbound.protection.outlook.com ([40.107.1.86]:45446
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729937AbfJHGZn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 8 Oct 2019 02:25:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZWJDIZCEvS62A3diRkQ/Y7HbVro8g51ubXcKQPI3RjZPNaJxqY5RcpX320mMFOrwNeHZjOL7KMwC6FEBJh8kHUdHasFMg7WcXZWlQoa/Jy3ksowEIyjDZt+LhW/3o3T2VC4AnQ9gAtc1aEM0dDJdOyS9XlSBFlMF97qfyIXjFXODyoQC5bIeZh2g3zQcjHrLku98d8DllpRXIAegicvXMo2HZn5x/PukcHtiAQl8KIR7VZDm2VL/Gp1/pFEI1CVMaWBKWPFcbJV/Qhg4IgtArSRUn4l44GZj7sz/EzRI6BKDv2EnIXaIsz9s9ENnKvBp0B/85CKF/DpnopPcTL2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJLOF/TmR2KDP96mM2bRWmewbIVYvGcinibF2TWdvfk=;
 b=WO/XPimsJl7cPi9wm47zbmB6f1EsEM4TOXNi2wCo4V8FISGlUrE01sPRy0KxWlAkit0IDJJ3vjRp2WbKjvzrU8qHTotXhyiYqMJszniXHg2mpmFeAtSoDqMZQONbP2GrZPN3wtU72Sc4Peyqb6tv6XQ5GJtaxPJmB4TNLiXdnoDHEEn5jHX4Dy8R96Exb2TAsBiheR2KZOcbr43Xk0KFOTLMWyu9+RCu6p4Bo+OpbJcqsYOlBkqbFW/A85UHK4elqntMY6cy/LfPW2oUEKc+XLmAFp/BNitzx5xwjYjxwTuMeTlFr0Nluv/B8VozuUV5BQVnkX14Zx7qI+bB9FBerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJLOF/TmR2KDP96mM2bRWmewbIVYvGcinibF2TWdvfk=;
 b=Ewn0YNno0Yyhu1qAML+QoFw8pb8/RtTfXJUTrRsRIb0Vj+vbVpUFUWxjmZsez5hRy3CulTZnek3hhNGUNQOkVAJ6SE1L97ueZYl8j0/V6MlP5EV/mhRinA2MQk2NgDA8M5l2gDczLFm33Pq88Y8wE/sQx8NB67ZTlESoOm57/wE=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB5326.eurprd04.prod.outlook.com (20.177.52.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 8 Oct 2019 06:25:40 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::1da:26dc:6373:4ab0%3]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 06:25:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Geis <pgwipeout@gmail.com>
CC:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [RFC] [PATCH 0/5] enable tegra-udc host mode
Thread-Topic: [RFC] [PATCH 0/5] enable tegra-udc host mode
Thread-Index: AQHVeMKaemQnqWQfNkyvyrtPZGC2hqdQUM+A
Date:   Tue, 8 Oct 2019 06:25:39 +0000
Message-ID: <20191008062523.GC5670@b29397-desktop>
References: <20191002014153.29831-1-pgwipeout@gmail.com>
In-Reply-To: <20191002014153.29831-1-pgwipeout@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac568971-daab-422c-5fcf-08d74bb856e4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR04MB5326:
x-microsoft-antispam-prvs: <VI1PR04MB5326512869FF974315CDC8828B9A0@VI1PR04MB5326.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(7736002)(316002)(186003)(76176011)(26005)(6246003)(81166006)(446003)(11346002)(256004)(25786009)(3846002)(6116002)(305945005)(8676002)(5660300002)(8936002)(53546011)(102836004)(1076003)(14454004)(99286004)(81156014)(4326008)(54906003)(6506007)(66066001)(71190400001)(71200400001)(91956017)(76116006)(478600001)(66946007)(66446008)(64756008)(66556008)(66476007)(33716001)(6436002)(44832011)(229853002)(9686003)(33656002)(6512007)(2906002)(1411001)(6486002)(476003)(6916009)(86362001)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5326;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ek1Ud46XcEqS+fXleD52M/QpJMroG60tT1p9Y/rMDb7Jt+VcSetWgZ6VUF1h3E4/peoIWEzivEm3Mu/5Gnky2IuPqHVBak6svfoP3iOpkyzGalT3iC3BbGMuXeGvpO3RA4y5I/kUkiqlaRSVlPSkyf/wbbfXBHtC82HOvFJnJkf6cZukyS18jnB79YmOVC2VDX7wySZs+AXRVU5bzvSbimMcGflqItreE5YUoY77WUVOiHy4VDxpa2JDNbQGzUmOdC+8DbzbHI7sFt75tRf7oMn63oj8dCIT5enT/YaP7Ri+syO/NIy+IKtiVJ7nJGfMeYFY89iuW3ydz1vNKKXV1MrmFlc3t9fi98AIw4x5psxKJCAsSRydgggzXb64jAokwNKXUJDGLrJjEwDe2jlLqhjsvmZeHklILzVDCY+EIEI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5A2A0FCC3EB51A47B6387A84578E29CA@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac568971-daab-422c-5fcf-08d74bb856e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 06:25:39.8418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bISJTPIzgzUGWWaR78sVGwTGF39ECXZ0vD2NiAHH9QCP0l+Jddrz8w7nmCRsw1x+k0I0muEoFUqPz1kqA89aTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5326
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19-10-01 21:41:48, Peter Geis wrote:
> This patch set enables the tegra-udc driver to take the place of
> tegra-ehci as the usb host driver.
> It fixes up some checks in the tegra-udc driver.
> It pulls the tegra specific bits from the tegra-ehci driver.
>=20
> It would be better to have generic helpers in the dma core that can
> handle alignment, instead of using tegra specific helpers, but that is
> well above my skillset.
>=20
> I haven't checked OTG functionality, mostly because I don't have any
> devices with working OTG yet.

I am not sure what the OTG mean here, the OTG Compliance (OTG FSM in
code) are almost dead, so you don't need to consider support it.
Usually, people considers dual-role switch as OTG.

Peter

>=20
> Please review and submit feedback.
>=20
> Peter Geis (5):
>   usb: chipidea: tegra: add tegra specific flags for host mode
>   usb: chipidea: tegra: clean up tegra_udc flag code
>   usb: chipidea: tegra: add dr_mode checking to tegra-udc
>   usb: chipidea: tegra: add the tegra specific bits
>   usb: chipidea: tegra: enable tegra-udc host mode
>=20
>  drivers/usb/chipidea/ci_hdrc_tegra.c |  53 ++++++---
>  drivers/usb/chipidea/host.c          |  13 +++
>  drivers/usb/chipidea/tegra.h         | 159 +++++++++++++++++++++++++++
>  include/linux/usb/chipidea.h         |   2 +
>  4 files changed, 209 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/usb/chipidea/tegra.h
>=20
> --=20
> 2.17.1
>=20

--=20

Thanks,
Peter Chen=
