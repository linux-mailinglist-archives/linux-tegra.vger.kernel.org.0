Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 353E753461A
	for <lists+linux-tegra@lfdr.de>; Wed, 25 May 2022 23:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235804AbiEYVzI (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 25 May 2022 17:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbiEYVzH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 May 2022 17:55:07 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687A1B8BD5
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 14:55:01 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-edeb6c3642so160464fac.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=W6FljHZ9ENFASNQNFv6FX7bVaR7auEJ4L2dhttwUEXI=;
        b=g8YykLdG4ph1pezv+JKBHsgme3ludALz48Qohgnxngt3JZtxvf/EyhJT26UtcQC7jQ
         8NagYHz6y7YZMHWdtU2dup/xmSn+STZ9jPQk8VUvcyZ+BzXx2xBofNx9BidZecFUAdCk
         IWtT5g1paRcQeH+pDZrNDjO5Vx/648rgrY9uRGuZTqPVQb/D5sTvHLb76PJTwBMrJJEc
         TdqCq2iCfaNjfITnK4TFkvPUrIXXa5FWip6wO6R8KD8NyeDOdAV1aKn7a6K/mfSSiPk9
         w6G2WRcX1EXZwpQfmwU56it/OuXAWwRRuv1dfnkK34IAfylzSUwKd6apicxI55K6MjYy
         sVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=W6FljHZ9ENFASNQNFv6FX7bVaR7auEJ4L2dhttwUEXI=;
        b=l+nho3xz0RH6IQYtLHjvmT6u4J8sM+ggTsRbcoUGGc2khDzZD13achC2jlb6+beVVa
         8ztuJMoItwOGMCPWI4mgtktFnE54mO1tPVvNXRGCun2p+truA7xw6USyT+6oBv/315cr
         lG1HGObSxjFNBp69AUnlSA7TMFoPdynBCl30kM3FGXp1vgSCUZY9Dv+Bto24vAyDO6tS
         qSv0LwV5dlaDgRfBSxQUQ76JFrtVVnYr31u8YaHA+bqKommNREeUrbVBR3eP+qmk88Pb
         X4JFQObOrMqd9l/gg0VQK6MYxRSBeOQmxqeExIFIyQ4auEcKPGALVBMnbRgdtZQoDQbT
         HVfw==
X-Gm-Message-State: AOAM530lDPDpjhA+whzcWZLvjES7+DNLGF1IjZ38Ve2tftl0D1NyCYAE
        47DvBZeTq3pVS5HZEVrRcqSGxt5c3HtEJnLYhmE=
X-Google-Smtp-Source: ABdhPJz/bnuRwA/RpCVwChN9bMyutP7AvZBYznO6JhGBRtkojh078TNYQgy/b/A9YPBD4rzcs6EihAti28EEKZ6I68A=
X-Received: by 2002:a05:6871:6a4:b0:f1:890d:a7c8 with SMTP id
 l36-20020a05687106a400b000f1890da7c8mr6810110oao.42.1653515699808; Wed, 25
 May 2022 14:54:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:110a:0:0:0:0:0 with HTTP; Wed, 25 May 2022 14:54:59
 -0700 (PDT)
From:   rymond chan <liugaoshan708@gmail.com>
Date:   Wed, 25 May 2022 14:54:59 -0700
Message-ID: <CAE8g+Aqk+n5nGCEmU+kBiBJuZ39qJ0NGpEmhqzZmUNu7f_EunQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

-- 
contact me Business  deal worth $47.1M USD for you contact me
