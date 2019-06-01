Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1581632014
	for <lists+linux-tegra@lfdr.de>; Sat,  1 Jun 2019 19:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfFARVn (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sat, 1 Jun 2019 13:21:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38376 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfFARVn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 1 Jun 2019 13:21:43 -0400
Received: by mail-lj1-f194.google.com with SMTP id o13so12519768lji.5
        for <linux-tegra@vger.kernel.org>; Sat, 01 Jun 2019 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tccTfkPaCkJqRCXrpmp0F9b3WbVNC0IPQMXCiDJx7Zw=;
        b=UZtlyyL6Ejbc3chPwsjMtIJrr+PXyz7LxaO4UIZFJt2+uxLH5ykzqraVFcICHhrsY9
         pGfOa7MQ2C6zVn3ddiQXwce6RVhQcO8AvhM3d3OmVGP9AlXxqoOqMNQtxdd+fsYhSoZ3
         6mdjty69zdNWY2S+vzaOoG3QQSTu3k9QJSCFac1JleRtSBsrOUd+FLpqegh+BbUlPfG2
         Ih1/6yKSKGQVyfe/wYgbkqaXy7OEU0wvX176nvmmPqyDNm/VH5RLolti/OKrXLhwTs5D
         U5ApdQK/AFDljwY6mE/ZUvu9SXcqTwmt1oX4FzuSMHFmNkx9doAwynnQDftnnTzwdz2t
         T8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tccTfkPaCkJqRCXrpmp0F9b3WbVNC0IPQMXCiDJx7Zw=;
        b=D3bcfNU7CQlIkOAY3tGiQzrXzSW7cM2XhvJ1K4XCecJKdUDQYutBvLbZ2uTdKLD/U7
         rJkGjqbbz1UaHGzKWkQGubEvL/+EK6VAMg9e+NdzrDeFaCD2fp7M5NkfIWdhbaDrN4pD
         KbQZDSF/w313VaOEuUmu+VYGz4uD2CoYoaeT6N8vLV9RDRlARDfoF17wOhRNFWLI0+RM
         dd+UOFt1UVWlwyK4BYHE4owKiBykn9lY9RbxIuiUajK8D3VIByzBoGXpKYhjxaNhZku7
         CYvYVK8NLktFv5QgL1S+CrsOQmFxOqGlYKMaovK8A6VyA/zVD6WITlz5D6V+unZfOJ4F
         gIDg==
X-Gm-Message-State: APjAAAXUtEGR8sRa7XwsF+2n6tr08vv5KXRHN7xWKr0cl6tnM+mpJ3bb
        wpmEo574sxeJ8Br6bmR43Z2uHeZ3HzUExGR0UdOebg==
X-Google-Smtp-Source: APXvYqy7Mf/XaWFq/LXOzPSf1s6Jcjn+sKV/HBkrnZUpN8ofis3WnAWx2KOtRgDlC08AA+7Y/pJ1KFcI15Rf9GhIu2A=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr2415646ljg.165.1559409701490;
 Sat, 01 Jun 2019 10:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
In-Reply-To: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:21:30 +0200
Message-ID: <CACRpkdYMx9obZV70EsieU_3eVVxqu9jVFpCO3Fk4t-2PUya97Q@mail.gmail.com>
Subject: Re: [PATCH V3 1/4] dt-binding: Tegra194 pinctrl support
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        Suresh Mangipudi <smangipudi@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, vidyas@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, May 16, 2019 at 1:53 PM Krishna Yarlagadda
<kyarlagadda@nvidia.com> wrote:

> Add binding doc for Tegra 194 pinctrl driver
>
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
> Changes in V3:
> remove optional fields not supported by pins published here

Patch applied with the tags.

Yours,
Linus Walleij
