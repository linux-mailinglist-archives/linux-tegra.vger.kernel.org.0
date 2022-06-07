Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41EA953FB41
	for <lists+linux-tegra@lfdr.de>; Tue,  7 Jun 2022 12:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbiFGKcX (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 7 Jun 2022 06:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236009AbiFGKcW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jun 2022 06:32:22 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0861165
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 03:32:18 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s68so15454928pgs.10
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jun 2022 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=K8sjQL70btqKJKL2P73yBG2F7sRnYyccHvFs9SOUGR8=;
        b=RTXx9MHQtRLTI52cPHnbS9O6MTcjIyvmHK13tonyP9MhwVDc9Abiy53K4LjYIIm8Vu
         CESmvWNi6TyIUpjQRXmb1DwBfsPiZwhAYs0AjT4PjImbRUwoiVrOScRFYMySbWWROSj/
         TRHygUijdzvUGHj72ut+1/Cv/bAX6skOQNPEzRKvJuhYXd0J/d8cjn0f/6afvkOr2/6E
         Fb7v5ScqdkGu1JusEIyAOJyvH6nHt6nEnapscgf+kPyXdEKbSVDrmQsXZ43y9wMGseHc
         kd1f5OU5Ev6xq3SxWnFZidgKwL3nfnGZr6VYPxYFsrrcKDNmPMMI+cTIVFuWNmBJ3jiC
         WWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=K8sjQL70btqKJKL2P73yBG2F7sRnYyccHvFs9SOUGR8=;
        b=oCcECkvT08CrrX7OUQRD7MUm1F0j+5Ov0mxhE2M/a7O8lEDE669V7zHcalcl+Dw4O5
         /rO1UuCLBtrINlrlLDA0OEuczBBaWB5d0ZyZNcOu54rzheU8W4PIxF5X9vM41aDi1H77
         8uw3CtoWcYpoeYp4jYykV/pwmBY2uRNjB5PGMbwv3VZMbZekwAfXSHY5BznALM0Fg+IK
         cNRqhqy4Yh+pID/ktQp65pC7fN/INX4K5LYs+9BrpgWM29kiGFZrAvyK/LYl7EB9MLEU
         ZEs1VJaa4SPJNXQLfb6gfa/zPmYSYZghm6BUqXKic0NZhbm9P1Tm503sm9Cq2KN+w+HM
         XflA==
X-Gm-Message-State: AOAM530t5JXnbQ1Hb6lJLyzABt+yUhMiZ2HZ0MCnSSphGHVWm+iL6FmA
        dtimUiN4rzC0vTXuMZzBFgwCuKP7Dk69+kf1Pbg=
X-Google-Smtp-Source: ABdhPJxFaYl7MLS6W8vzvIVRJjWp56+XBCBsBhN2IL4rqGe2A0PoTU0gyBAc8j6AjJubHGM+EeBeNI4aBr8qg/SA2EI=
X-Received: by 2002:a62:7cd2:0:b0:51b:9ba6:a028 with SMTP id
 x201-20020a627cd2000000b0051b9ba6a028mr36044480pfc.24.1654597937990; Tue, 07
 Jun 2022 03:32:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:867a:0:0:0:0 with HTTP; Tue, 7 Jun 2022 03:32:17
 -0700 (PDT)
Reply-To: orlandomoris56@gmail.com
From:   Orlando Moris <ouroakononassoumanou@gmail.com>
Date:   Tue, 7 Jun 2022 10:32:17 +0000
Message-ID: <CA+X4su2X++RxLR-nKhgqiDrQ9uSynQoGM6n3_-S7n+2Q2Fp-Vw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=6.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:52f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4999]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ouroakononassoumanou[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [orlandomoris56[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SGFsbMOzLCB2aW5zYW1sZWdhIHZlcmnDsCB1cHBsw71zdCB1bSBhw7Agw75lc3NpIHTDtmx2dXDD
s3N0dXIgc2VtIGtvbSDDrQ0KcMOzc3Row7NsZmnDsCDDvml0dCBlciBla2tpIHZpbGxhIGhlbGR1
ciB2YXIgc8OpcnN0YWtsZWdhIGJlaW50IHRpbCDDvsOtbiB0aWwNCmfDs8OwcmFyIHVtaHVnc3Vu
YXIuIMOJZyBlciBtZcOwIHRpbGzDtmd1IHVwcCDDoSAoJDcuNTAwLjAwMC4wMCkgc2VtIGzDoXRp
bm4NCnZpw7Bza2lwdGF2aW51ciBtaW5uLCB2ZXJrZnLDpsOwaW5ndXIgQ2FybG9zLCBza2lsZGkg
ZWZ0aXIsIHNlbSDDocOwdXIgZW4NCmhhbm4gbMOpc3Qgw60gw7NoZXBwaWxlZ3UgYsOtbHNseXNp
IG1lw7AgZmrDtmxza3lsZHUgc2lubmksIGJqw7Mgb2cgc3RhcmZhw7BpDQpow6lyIMOtIChMb23D
qSBUw7Nnw7MpLiDDiWcgaGVmIHNhbWJhbmQgdmnDsCDDvmlnIHNlbSBuw6FudXN0dSBhw7BzdGFu
ZGVuZHVyDQpoYW5uIHN2byDDvsO6IGdldGlyIGZlbmdpw7AgZsOpw7Agw6Ega3LDtmZ1bS4gw6Eg
c2tqw7N0dW0gdmnDsGJyw7Znw7B1bSDDvsOtbnVtIG11bg0Kw6lnIHVwcGzDvXNhIMO+aWcgdW0g
aHZlcm5pZw0KZnJhbWt2w6ZtZCDDvmVzc2Egc8OhdHRtw6FsYS4sIGhhZsOwdSBzYW1iYW5kIHZp
w7AgbWlnIMOtIMO+ZXNzdW0gdMO2bHZ1cMOzc3R1bQ0KKG9ybGFuZG9tb3JpczU2QGdtYWlsLmNv
bSkNCg==
