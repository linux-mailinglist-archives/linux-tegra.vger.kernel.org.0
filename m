Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD50410E320
	for <lists+linux-tegra@lfdr.de>; Sun,  1 Dec 2019 19:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfLAS3l (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 1 Dec 2019 13:29:41 -0500
Received: from mtax.cdmx.gob.mx ([187.141.35.197]:14583 "EHLO mtax.cdmx.gob.mx"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727312AbfLAS3k (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 1 Dec 2019 13:29:40 -0500
X-Greylist: delayed 7137 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Dec 2019 13:29:40 EST
X-NAI-Header: Modified by McAfee Email Gateway (4500)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cdmx.gob.mx; s=72359050-3965-11E6-920A-0192F7A2F08E;
        t=1575217647; h=DKIM-Filter:X-Virus-Scanned:
         Content-Type:MIME-Version:Content-Transfer-Encoding:
         Content-Description:Subject:To:From:Date:Message-Id:
         X-AnalysisOut:X-AnalysisOut:X-AnalysisOut:
         X-AnalysisOut:X-AnalysisOut:X-SAAS-TrackingID:
         X-NAI-Spam-Flag:X-NAI-Spam-Threshold:X-NAI-Spam-Score:
         X-NAI-Spam-Rules:X-NAI-Spam-Version; bh=M
        8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs4
        8=; b=Gi/dLT9ddbCj1rFPQTJyg+190Nfm3JZ4mcrlN9Twtkbf
        InQGGe+JYi4sdx8035vB6vLlEb7+X63AnTO0k24+USklr1bWCF
        WZNjwaQHUxTR48BN2BPYE6fWDBB9ctvHa0OCah7HY3Yha0dSn8
        jlioC+b3RKw9GL2VDnNr6UPSIZg=
Received: from cdmx.gob.mx (correo.cdmx.gob.mx [10.250.108.150]) by mtax.cdmx.gob.mx with smtp
        (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
         id 1a22_5101_9f1fa929_ef6c_42fe_b3c2_151b03443d3f;
        Sun, 01 Dec 2019 10:27:26 -0600
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id 2389E1E2F50;
        Sun,  1 Dec 2019 10:18:52 -0600 (CST)
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GFCJJ61_3FDm; Sun,  1 Dec 2019 10:18:51 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
        by cdmx.gob.mx (Postfix) with ESMTP id B9F7E1E284B;
        Sun,  1 Dec 2019 10:14:20 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.9.2 cdmx.gob.mx B9F7E1E284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cdmx.gob.mx;
        s=72359050-3965-11E6-920A-0192F7A2F08E; t=1575216860;
        bh=M8rWdUYQ57RAYAgTWJQ4Rsch0kO0UXllaAVDzocOs48=;
        h=Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:
         From:Date:Message-Id;
        b=AXOGRNnW98GDIDw2c0JWNKr/rHQYsyq6SzXDXw1lZtcxG4UYA+tSNeQPGmyT6lDxr
         xav8zr3+31zIPBKSAzoD+VqXQ9FKUfBjJmG+iNJ5ryavmXitnjOyUyOiKlkci2mVSS
         yULPrN7CtB0GcY0v29fLRPQTjOEkAvG5kTCGAlYg=
X-Virus-Scanned: amavisd-new at cdmx.gob.mx
Received: from cdmx.gob.mx ([127.0.0.1])
        by localhost (cdmx.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Nepq5P905LUF; Sun,  1 Dec 2019 10:14:20 -0600 (CST)
Received: from [192.168.0.104] (unknown [188.125.168.160])
        by cdmx.gob.mx (Postfix) with ESMTPSA id E48981E29BE;
        Sun,  1 Dec 2019 10:05:35 -0600 (CST)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Congratulations
To:     Recipients <aac-styfe@cdmx.gob.mx>
From:   "Bishop Johnr" <aac-styfe@cdmx.gob.mx>
Date:   Sun, 01 Dec 2019 17:05:27 +0100
Message-Id: <20191201160535.E48981E29BE@cdmx.gob.mx>
X-AnalysisOut: [v=2.2 cv=Rf/gMxlv c=1 sm=1 tr=0 p=6K-Ig8iNAUou4E5wYCEA:9 p]
X-AnalysisOut: [=zRI05YRXt28A:10 a=T6zFoIZ12MK39YzkfxrL7A==:117 a=9152RP8M]
X-AnalysisOut: [6GQqDhC/mI/QXQ==:17 a=8nJEP1OIZ-IA:10 a=pxVhFHJ0LMsA:10 a=]
X-AnalysisOut: [pGLkceISAAAA:8 a=wPNLvfGTeEIA:10 a=M8O0W8wq6qAA:10 a=Ygvjr]
X-AnalysisOut: [iKHvHXA2FhpO6d-:22]
X-SAAS-TrackingID: ce9e3ed5.0.105105116.00-2326.176706398.s12p02m011.mxlogic.net
X-NAI-Spam-Flag: NO
X-NAI-Spam-Threshold: 3
X-NAI-Spam-Score: -5000
X-NAI-Spam-Rules: 1 Rules triggered
        WHITELISTED=-5000
X-NAI-Spam-Version: 2.3.0.9418 : core <6686> : inlines <7165> : streams
 <1840193> : uri <2949750>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Money was donated to you by Mr and Mrs Allen and Violet Large, just contact=
 them with this email for more information =


EMail: allenandvioletlargeaward@gmail.com
