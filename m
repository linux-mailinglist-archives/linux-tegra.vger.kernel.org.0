Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0B75AE261
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Sep 2022 10:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239138AbiIFIYI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 6 Sep 2022 04:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234243AbiIFIYB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Sep 2022 04:24:01 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C5C75CF6
        for <linux-tegra@vger.kernel.org>; Tue,  6 Sep 2022 01:23:59 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id q21so6464496edc.9
        for <linux-tegra@vger.kernel.org>; Tue, 06 Sep 2022 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date;
        bh=lk48dpXXsuu5ARoJ5XuegOX8j4ipQriRDVKMsSHlKZs=;
        b=lXtakTaTkPJ+Bll8eBlk/BLUVBXxdxFVZI32L8ugced498ZIyb3XjxGZcvGXIjRq/h
         7EHH/tXbsTV52zsTbd0mJWv/bSHpxY2dbctI3k56UnjYYo22aL+2XSDyFUM2F9XD01fK
         1e5RhS7cBCCkMT9eLhcYOlebX7a71ehDVTPrILHIF6jwfC7euJ76p2xJ0hPQznDTh1Tf
         FzfbaU9KyrdtN8uFZr2eWm79AvN2x1vMDgt4riWShiEjcXcHPvchn0veHZmt2dczbTdg
         7aLcy3J8kbx5o/HdR5fEItbJHKhtOIRS7g4A39JjbXPowb7nM7kJRZVCSBSBgllL53zl
         8JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lk48dpXXsuu5ARoJ5XuegOX8j4ipQriRDVKMsSHlKZs=;
        b=BpYHyLpbO7oOEqRB+R0w3sVh/R62hnaGlqrjQCML+iY1u3ZkIHsbE5vWn27Xy0FzZm
         +7cTbadDSwUvfjOT4F1Uik82LifU9Sjaz28Mj0TozJm2K+RQL+y1sGvytgbQjIshDg4/
         Nd/YpqoUJeI1aDKdX7qQN6bKxCBH+Ba8pngtUUyOCUCt287+2z1+uqROiMOo1HjDZEY6
         Fu4lyc/zz0AGptQ9SzymmDrIpHti2JzMfk/1/XTtRY8tqSXEuwhd9MkYXRxCc/McCH+p
         8QHY9lmPktkMe8EQouzoSOSKRNAPylUJEKjtNyq52ulipfJeYC/kn+M5Kz1vqMyEhylO
         iNsQ==
X-Gm-Message-State: ACgBeo3aqsgN/Ano28BAEen8u0OOG9tMrkGvvaykn5/UkQr6V04VKE9E
        8oJmO87061E53sMElqvifRERQ6mTK4EoAI02Bmw=
X-Google-Smtp-Source: AA6agR4Evwau4eK6OSy2IMW39NDUfOOkTC6hXtC1CdxRST3Rp0IMaJ4mKEAkME52Ve7izeXAYBDI8q019sbeI09uJkI=
X-Received: by 2002:a05:6402:4007:b0:448:6c4c:b40 with SMTP id
 d7-20020a056402400700b004486c4c0b40mr35209725eda.422.1662452638060; Tue, 06
 Sep 2022 01:23:58 -0700 (PDT)
MIME-Version: 1.0
Sender: mahamoudaware@gmail.com
Received: by 2002:a05:6402:11cd:b0:447:58c9:b944 with HTTP; Tue, 6 Sep 2022
 01:23:57 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Tue, 6 Sep 2022 08:23:57 +0000
X-Google-Sender-Auth: tJpwuRU_1Kjjh8lLdQsiX6tXeCk
Message-ID: <CAC==OQegV6_uBxfXVXD6nyzMZv_5_Ocdnty09Oeb-aX=-hSpLA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

0J/QvtC30LTRgNCw0LIsINCy0LXRgNGD0LLQsNGY0YLQtSDQtNC10LrQsCDRgdGC0LUg0LTQvtCx
0YDQuC4g0LLQtSDQvNC+0LvQuNC80LUg0L/RgNC+0LLQtdGA0LXRgtC1INC4INC+0LTQs9C+0LLQ
vtGA0LXRgtC1INC90LANCtC80L7QuNGC0LUg0L/RgNC10YLRhdC+0LTQvdC4INC1LdC/0L7RiNGC
0LAg0LTQviDQstCw0YEuDQo=
