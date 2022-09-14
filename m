Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358075B90FB
	for <lists+linux-tegra@lfdr.de>; Thu, 15 Sep 2022 01:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiINXhr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 14 Sep 2022 19:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiINXhq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Sep 2022 19:37:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 037803A4BA
        for <linux-tegra@vger.kernel.org>; Wed, 14 Sep 2022 16:37:45 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q21so27738079lfo.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Sep 2022 16:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date;
        bh=ShE51VUQ4axb0Bz/NABdTBjNwA+Qofa4jx9r0eRkBes=;
        b=iwoV1reAgTrYjyidwwZRBvXFawUTJny2hO/DIx2G9WeQeBl3da6F0CPBNhLBFO62DI
         KX96yD/vcgkEDW1NLt6zV8Hj2QmOVmu4WWfYhFqDARoaeboT9nh/QKQ71mNolsDWpvSr
         JRfupmtb+O3VkalsGm92vxO2f8+iSNQzHqFdfJVTQuRrsbsi3eDFInNlGeMWJjtcH9aA
         +0MhF/qy/XiR+FekdPAV5wCbcvwvTpoHvsLL7ZBtcDZ6GhhK2C63VvD4UCr7r4m6YuWO
         UdGfzCRwM/VIvi6apTSajskTdxGNh4zGFWH3ccDfWmJ7NFgNqxUeu1+2FZBTl575G0Fp
         /JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ShE51VUQ4axb0Bz/NABdTBjNwA+Qofa4jx9r0eRkBes=;
        b=w7o1Ee5FQoNaVBO2se8LoCivUivjNBbSgZhAg7bwuNHPZPWTWPJxZE/jmBv/PDHyAp
         po1TA/ZrnmTNkqGyx7oAD4o9m8UCtpCQQUtaP1vp43fUymQi+RM4PSRzkd09FdK2o0LV
         Yk4CZoMxTlMhM3U4KUP+rCMryFq92WtjwcpYvfZ9EDe6QDCMulKkui3Oger+Y4315fgA
         YFV1ZpZsYOmfq1ytr2B78788uC4RhKC+e3hqrIjb/tHTwpW7Bh2BFLq9xm7sv3Y75jOD
         avoAHC4DsNIOE3IJdPGYV6LjUae0dFAE7s94X0QfNIeSJymxuKTA5DbEM/Qds3PUssle
         /nUg==
X-Gm-Message-State: ACgBeo08hmF8blmJn1Nmo+XkoFt1ox6tf9XA9Gk1EUOKYaiJEoh3pP5X
        83ahI1dgWyZxZ5tuf38zD/gAOhBWxnJnfw23Rjs=
X-Google-Smtp-Source: AA6agR4yNwl9pPy9erJfZOOcjbcJJzcmEzKSJrONnYrHsDvl+/v0gzLdgE47jlK2m0qg3ENdmwFl0jkVuRepNZxa33w=
X-Received: by 2002:a05:6512:3281:b0:496:f9b5:eb55 with SMTP id
 p1-20020a056512328100b00496f9b5eb55mr12938617lfe.279.1663198663305; Wed, 14
 Sep 2022 16:37:43 -0700 (PDT)
MIME-Version: 1.0
Sender: anselmenicki@gmail.com
Received: by 2002:a2e:a0c3:0:0:0:0:0 with HTTP; Wed, 14 Sep 2022 16:37:42
 -0700 (PDT)
From:   John Kumor <omaralaji51@gmail.com>
Date:   Wed, 14 Sep 2022 23:37:42 +0000
X-Google-Sender-Auth: uLfjCKS0_5CLsm-vIbfl2FTnJOw
Message-ID: <CANbcXbHWmHkZD76L7Huv6taX2qgFN0hd7KF7dz4niv7QF6Y5mw@mail.gmail.com>
Subject: It's urgent.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Greetings!!
Did you receive my previous email?
Please reply back it=E2=80=99s urgent.
Regards,
Attorney John.
