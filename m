Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270835AE26F
	for <lists+linux-tegra@lfdr.de>; Tue,  6 Sep 2022 10:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbiIFI0f (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 6 Sep 2022 04:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbiIFI0f (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Sep 2022 04:26:35 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DEF5209A
        for <linux-tegra@vger.kernel.org>; Tue,  6 Sep 2022 01:26:34 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id kk26so21424122ejc.11
        for <linux-tegra@vger.kernel.org>; Tue, 06 Sep 2022 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date;
        bh=lk48dpXXsuu5ARoJ5XuegOX8j4ipQriRDVKMsSHlKZs=;
        b=RogddVT3nrY9yGiztMESNVS6nK3yFoCFREEGBNP8E8l8QWf4YzETX5LYg2+IITQd5B
         uurlXl6UeIdIq1cn1bKhE9QaMwBVRlleRhVxfaGWArf69YvOcpqrxiP7ir7Gwpdek3et
         VGk/gwO+0S8ZcxNjgKeZ+keOJVtNmGdMvxyYBuaZ7dgsAOnHDCPFJkGtKgCmdQI0RYu9
         b0tXVy67YgKpNZXNJOqKFYQWr0Mhsx0AQFykQXvsY+gBgTArXawEtI+++0Bj3QWjks59
         EOv1ufEzuuYZkuAWnd/JERNalbDiy/P1ALIz+9JXyi+wfWozSfZ5SwBRltoXkNqVgfnX
         Shrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lk48dpXXsuu5ARoJ5XuegOX8j4ipQriRDVKMsSHlKZs=;
        b=rpPUuJMB7eh0DKlbWUo0BtqBAYZYf8DNYiwrZee4mG3Z3X8bKG5cTtyiz4ouSky/3W
         0n7mG5K5vh3vYm8Ltxho+asoHNoKBddp12bhIXkxH71Mx0/IC/bl+Myr5Ouw//7nFrbS
         uVZd/lV8HIxoArRIvDkxejK3xGlVUMpXr+DwTvvenFnjVEO89ZTbR3P0nCodigfsi1hg
         PT+NJMfzZPNNuZOSsSPVLhobsIDlTBsRd6PDLhdVE3QOmkpKbtTCFRzKNVN/hlqfWQvm
         YTg/d7k5uzQUKADwEdH1HllU7jnI14baS8xjFzIPAGn+PofryfZO1WNDI+dcK27aHRFE
         f9GQ==
X-Gm-Message-State: ACgBeo1/eHvJUPG11o+ngeo2FhP+slnLPomS/IBAWRkki15S4oXMJ62E
        4q/b9XPwKMZsh3T3bGhzZKZ2fh9QhTxbce/dwC8=
X-Google-Smtp-Source: AA6agR561dLv9m4TOaNhk7cgvrGlHc9wHWAVxsY9Zc7x0zUUbMeP0g7BvrbVAherV2lr8L1c/YGBzxjFV2g+b8nrv+M=
X-Received: by 2002:a17:906:959:b0:741:6f76:546f with SMTP id
 j25-20020a170906095900b007416f76546fmr30618595ejd.32.1662452792612; Tue, 06
 Sep 2022 01:26:32 -0700 (PDT)
MIME-Version: 1.0
Sender: mahamoudaware@gmail.com
Received: by 2002:a05:6402:11cd:b0:447:58c9:b944 with HTTP; Tue, 6 Sep 2022
 01:26:32 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Tue, 6 Sep 2022 08:26:32 +0000
X-Google-Sender-Auth: FZGllB-Y4dmjyFzsAUvo-lUPdx0
Message-ID: <CAC==OQcsLWn9n=yCbjbL+xqhP9bB72S9wYoVrPnnRTtv8XgXOw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
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
