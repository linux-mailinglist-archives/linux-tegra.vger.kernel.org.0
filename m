Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267AC44EAAF
	for <lists+linux-tegra@lfdr.de>; Fri, 12 Nov 2021 16:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhKLPo6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 12 Nov 2021 10:44:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232194AbhKLPo5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 10:44:57 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F57C061766
        for <linux-tegra@vger.kernel.org>; Fri, 12 Nov 2021 07:42:06 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id u16so6498060qvk.4
        for <linux-tegra@vger.kernel.org>; Fri, 12 Nov 2021 07:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=kZ9prx+4HqzK7EoD5Uxt628fpWxGMI0rECIRnsOtYSE=;
        b=gB2jVgwpEyW36I4g5xkxDw+Wxxn6+bfFmFbQn/pD84ECfksnI6wdGPEcdHQ+mfWxwn
         GQSnLc61V442/niolosQWC5HW2/Bqc3K37DexC7PZYijyDV8lGeRJCz4/LmDaqi1Alxq
         ffsYEBvBfvTV3ha0Fg3aOhqTo1VO+HunAk2oFpXfyRIVlNCa+w5SO3MQAd0lQExyqBIT
         CpZUtBRO7ouuFP2wRa2dLymV4s7Fo58P10XiLPQHc3R5fsZlHFivpKeUAmoW0cLj7NSh
         Q34SodN+zsnBd/Fk4Bu5qN+19TU5Q6Mx3r57YGXjIFbehNXpzJAdA60BK86D0fMKRLhl
         Bt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=kZ9prx+4HqzK7EoD5Uxt628fpWxGMI0rECIRnsOtYSE=;
        b=Ce4ok6mEepLRb3uv2ydMe+tjJP9gyyYuOgZDIGdOSSaW6doaJ7ksyqiVnMWKPwPtqA
         Tsp1gDk/QYzE8bNbkQUc9YFYuqu4V193f5rBc1txOzaXmBi1M2bPbIz65o6+iOe2w+mA
         ogyJMD0NbOkMJ0kfrTMN/pbWb5MiSrLCG1sriWcarD9+a1QhKwe4fJnIPX4EirbUBiDx
         9I0LKMWZ/Ln519Ijhdq1HEo62PAyJUlka/u8sPO8X9Qa1sedHMzBS9jt4Wt6tYSu1guy
         3DGqwct77RsQ60ej1uil4FyQEa1y6DCcM0S//2FXRmT2YNu2Xm9BsGYDs4R4RuqQ6qlw
         lAoQ==
X-Gm-Message-State: AOAM530Qypc88IH7fZXNmkHYbant/BpmklBD681FY+8q/KNdeP+F8+Kb
        ylvq1V2xneriHXFHpa/XCJmZNYFHe0lf9hFGg7le3LtPQROvSg==
X-Google-Smtp-Source: ABdhPJzXORiuuCCXidMS0x/4BT0r1PeF7pv2o9LD2E27J/RKKilhv4rxtLdjVVq2GApLnIB60+Ih+/DuxJh1s/rmAFE=
X-Received: by 2002:ad4:4f2e:: with SMTP id fc14mr15539555qvb.66.1636731726126;
 Fri, 12 Nov 2021 07:42:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0c:f443:0:0:0:0:0 with HTTP; Fri, 12 Nov 2021 07:42:05
 -0800 (PST)
Reply-To: collinsallen23@outlook.com
From:   collins <ulricaalfred1@gmail.com>
Date:   Fri, 12 Nov 2021 15:42:05 +0000
Message-ID: <CAAEJRv38WOmMwa+BKizUby6whPbcfYnu1b9K0dxiwCKtEZ_wng@mail.gmail.com>
Subject: =?UTF-8?B?R3LDvMOfZQ==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Ich habe mich gefragt, ob Sie meine Post erhalten haben
