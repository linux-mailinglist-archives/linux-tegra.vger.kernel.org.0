Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6C23EBD79
	for <lists+linux-tegra@lfdr.de>; Fri, 13 Aug 2021 22:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbhHMUiY (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 13 Aug 2021 16:38:24 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40768 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233915AbhHMUiY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Aug 2021 16:38:24 -0400
Received: by mail-ot1-f50.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so13513037oth.7;
        Fri, 13 Aug 2021 13:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uge++jdV8hZVuGx4sX1iqwS2v7HWDBN7pZ3sxa513Os=;
        b=IT7no11v+H3Xh7oiNiucRSg8ZtvylAEaUfwrS3auvfjk+DX2JbC0CbyEC5mrQPFkP1
         vsngEPoN+fWSusjYcUllQTjwI6ConfTlBftVKFLxPRAZ2/5fXHY1ZqzLFcY5GNVUCian
         m2xjsMJZBZlt9wI2m9+fd+7C+FyLf+DLRupoU/JzLCioG9x21SS8Wz4IAwzsa4OyTXK4
         UFx0oQo2zrPBaL2wnCpflvQIi2l4vcTW74x0w0xV52H+bpIh9tsPyQv6ZVETegBVgv30
         Z5ipD8OUAo5goTOlIm1Nj1avQ5vyCKdOiA0DCLSDUrAhbDap7iT2vV/QWy91NqPI/Zd7
         bs6g==
X-Gm-Message-State: AOAM531P//f7Y6Sm+tz921kpN/WoAvlRMtVTq1dMuXqYRVvoPF37a/2N
        F/lltLYM6xwTZvLafqNvVg==
X-Google-Smtp-Source: ABdhPJxkGTxumL5M/sOxVEzvH3QItuiwmNWSlWwzGAvPgpKvViQ6pXGErpUvZNomsJ9KIoggkjynVw==
X-Received: by 2002:a9d:38f:: with SMTP id f15mr3540263otf.253.1628887076804;
        Fri, 13 Aug 2021 13:37:56 -0700 (PDT)
Received: from robh.at.kernel.org (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com. [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
        by smtp.gmail.com with ESMTPSA id k2sm529367otp.2.2021.08.13.13.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 13:37:55 -0700 (PDT)
Received: (nullmailer pid 3987020 invoked by uid 1000);
        Fri, 13 Aug 2021 20:37:54 -0000
Date:   Fri, 13 Aug 2021 15:37:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add YAML bindings for Host1x and
 NVDEC
Message-ID: <YRbYImV8V+DElpy7@robh.at.kernel.org>
References: <20210806123450.2970777-1-mperttunen@nvidia.com>
 <20210806123450.2970777-2-mperttunen@nvidia.com>
 <YRKengKZmFtgsIZy@orome.fritz.box>
 <c06df24f-989b-fdfe-ea04-867de1aa8828@nvidia.com>
 <YRKlA7aBYOuElXDe@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRKlA7aBYOuElXDe@orome.fritz.box>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Aug 10, 2021 at 06:10:43PM +0200, Thierry Reding wrote:
> On Tue, Aug 10, 2021 at 06:50:26PM +0300, Mikko Perttunen wrote:
> > On 10.8.2021 18.43, Thierry Reding wrote:
> > > On Fri, Aug 06, 2021 at 03:34:48PM +0300, Mikko Perttunen wrote:
> > > > Convert the original Host1x bindings to YAML and add new bindings for
> > > > NVDEC, now in a more appropriate location. The old text bindings
> > > > for Host1x and engines are still kept at display/tegra/ since they
> > > > encompass a lot more engines that haven't been converted over yet.
> > > > 
> > > > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > > > ---
> > > > v2:
> > > > * Fix issues pointed out in v1
> > > > * Add T194 nvidia,instance property
> > > > ---
> > > >   .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 131 ++++++++++++++++++
> > > >   .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 +++++++++++++++
> > > >   MAINTAINERS                                   |   1 +
> > > >   3 files changed, 241 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
> > > >   create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > 
> > > Can we split off the NVDEC bindings addition into a separate patch? I've
> > > been working on converting the existing host1x bindings in full to json-
> > > schema and this partial conversion would conflict with that effort.
> > > 
> > > I assume that NVDEC itself validates properly even if host1x hasn't been
> > > converted yet?
> > 
> > Sure. I thought I had some problems with this before but can't see any now.
> > 
> > > 
> > > > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > > new file mode 100644
> > > > index 000000000000..fc535bb7aee0
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> > > > @@ -0,0 +1,109 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvdec.yaml#"
> > > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > > +
> > > > +title: Device tree binding for NVIDIA Tegra NVDEC
> > > > +
> > > > +description: |
> > > > +  NVDEC is the hardware video decoder present on NVIDIA Tegra210
> > > > +  and newer chips. It is located on the Host1x bus and typically
> > > > +  programmed through Host1x channels.
> > > > +
> > > > +maintainers:
> > > > +  - Thierry Reding <treding@gmail.com>
> > > > +  - Mikko Perttunen <mperttunen@nvidia.com>
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: "^nvdec@[0-9a-f]*$"
> > > > +
> > > > +  compatible:
> > > > +    enum:
> > > > +      - nvidia,tegra210-nvdec
> > > > +      - nvidia,tegra186-nvdec
> > > > +      - nvidia,tegra194-nvdec
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: nvdec
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-names:
> > > > +    items:
> > > > +      - const: nvdec
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  iommus:
> > > > +    maxItems: 1
> > > > +
> > > > +  interconnects:
> > > > +    items:
> > > > +      - description: DMA read memory client
> > > > +      - description: DMA read 2 memory client
> > > > +      - description: DMA write memory client
> > > > +
> > > > +  interconnect-names:
> > > > +    items:
> > > > +      - const: dma-mem
> > > > +      - const: read2
> > > 
> > > The convention that we've used so far has been to start numbering these
> > > at 0 and use a dash, so this would be "read-1".
> > 
> > Will fix.
> > 
> > > 
> > > > +      - const: write
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - resets
> > > > +  - reset-names
> > > > +  - power-domains
> > > > +
> > > > +if:
> > > > +  properties:
> > > > +    compatible:
> > > > +      contains:
> > > > +        const: nvidia,tegra194-host1x
> > > > +then:
> > > > +  properties:
> > > > +    nvidia,instance:
> > > > +      items:
> > > > +        - description: 0 for NVDEC0, or 1 for NVDEC1
> > > 
> > > I know we had discussed this before, but looking at the driver patch, I
> > > don't actually see this being used now, so I wonder if we still need it.
> > > 
> > > > +additionalProperties: true
> > > 
> > > Maybe this should have a comment noting that this should really be
> > > unevaluatedProperties: false, but we can't use that because the tooling
> > > doesn't support it yet?

Use 'unevaluatedProperties: false'. There's support in jsonschema pkg 
master now, so we should have support working soon. I've run it with the 
kernel tree as well. I was surprised there weren't many issues...

'additionalProperties: true' should only ever be used for incomplete 
collections of properties (i.e. common bindings). I haven't come up with 
a meta-schema to check this. We'd probably need to point to different 
meta-schemas.

> > 
> > I can add such a comment if desired. Honestly, I don't really know what
> > 'unevaluatedProperties' means or does -- the explanation in
> > example-schema.yaml doesn't seem like it's relevant here and I cannot find
> > any other documentation.
> 
> It's basically like additionalProperties, except that it applies to
> properties evaluated via if: blocks.
> 
> So with additionalProperties: false, the presence of the nvidia,instance
> property in a Tegra194 DTS file would cause a validation failure because
> it's a property that was not defined in the properties: block.
> 
> With unevaluatedProperties: false, on the other hand, the properties
> that are defined in the if: block above will become a evaluated
> properties and therefore a Tegra194 DTS with the nvidia,instance
> property present would succeed validation. Unless, of course, if it
> contained additional properties that are not defined in any of the
> properties: blocks (either unconditional or conditional ones).
> 
> So in other words, the additionalProperties schema applies to all
> unconditionally defined properties, whereas unevaluatedProperties
> applies to all (conditionally and unconditionally) defined properties.

I generally discourage only defining the properties in an if/then. 
Partly because unevaluatedProperties wasn't implemented. I guess if a 
property is only allowed in the 'then' case, it makes sense. But if the 
property is just different constraints for then and else, then I'd 
define it in the main section.

Rob 
